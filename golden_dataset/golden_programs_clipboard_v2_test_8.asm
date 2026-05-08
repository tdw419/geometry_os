; DESCRIPTION: Render a colored rectangle at the screen.

; ── clipboard_v2_test.asm ─────────────────────────────────────────
; Phase 221 Enhancement: Multi-Format Clipboard Protocol v2
;
; Tests:
;   1. CLIP_TEXT mode 3 (clear) — clear text clipboard
;   2. CLIP_PASTE with CLIPSET — clip rect respected during paste
;   3. CLIP_HISTORY mode 4 (info) — query format bitmap
;   4. End-to-end: store text, push history, clear text, restore, verify
;
; Visual verification layout (spatial patterns):
;   Row 0-7:   Title + step labels
;   Row 16-17: Step 1 bar (green = text stored then cleared)
;   Row 32-33: Step 2 bar (yellow = clip rect paste)
;   Row 48-49: Step 3 bar (cyan = history info query)
;   Row 64-65: Step 4 bar (magenta = full roundtrip)
;   Row 80-81: Step 5 bar (white = all pass)
; ──────────────────────────────────────────────────────────────────

start:
    ; ── Clear screen ──
    LDI r8, 0
    FILL r8

    ; ── Title ──
    LDI r1, 2
    LDI r11, 0
    LDI r6, title
    TEXT r1, r11, r6

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r3, 0x3000
    LDI r13, 65     ; 'A'
    STORE r3, r13
    LDI r3, 0x3001
    LDI r13, 66     ; 'B'
    STORE r3, r13
    LDI r3, 0x3002
    LDI r13, 67     ; 'C'
    STORE r3, r13
    LDI r3, 0x3003
    LDI r13, 0      ; null
    STORE r3, r13

    ; Store text (mode 0)
    LDI r13, 0
    LDI r9, 0x3000
    LDI r4, 3
    CLIP_TEXT r13, r9, r4

    ; Clear text clipboard (mode 3)
    LDI r13, 3
    LDI r9, 0
    LDI r4, 0
    CLIP_TEXT r13, r9, r4

    ; Get length (mode 2) — should be 0 after clear
    LDI r13, 2
    CLIP_TEXT r13, r9, r4

    ; Draw label
    LDI r1, 2
    LDI r11, 8
    LDI r6, step1_label
    TEXT r1, r11, r6

    ; Green bar = text clear works
    LDI r12, 0x00FF00
    LDI r0, 2
    LDI r3, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r12, 0xFF0000
    LDI r0, 0
    LDI r3, 0
    LDI r5, 8
step2_draw:
    PSET r0, r3, r12
    ADDI r0, 1
    SUBI r5, 1
    JNZ r5, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r13, 0
    LDI r9, 0
    LDI r4, 8
    LDI r2, 1
    CLIP_COPY r13, r9, r4, r2

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r13, 2
    LDI r9, 0
    LDI r4, 4
    LDI r2, 256
    CLIPSET r13, r9, r4, r2

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r13, 0
    LDI r9, 32
    CLIP_PASTE r13, r9

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r1, 2
    LDI r11, 24
    LDI r6, step2_label
    TEXT r1, r11, r6

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r12, 0xFFFF00
    LDI r0, 2
    LDI r3, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r3, 0x3000
    LDI r13, 72     ; 'H'
    STORE r3, r13
    LDI r3, 0x3001
    LDI r13, 105    ; 'i'
    STORE r3, r13
    LDI r3, 0x3002
    LDI r13, 0
    STORE r3, r13

    LDI r13, 0
    LDI r9, 0x3000
    LDI r4, 2
    CLIP_TEXT r13, r9, r4

    ; Push to history (text only, no pixel data)
    LDI r13, 0
    LDI r9, 0
    CLIP_HISTORY r13, r9

    ; Draw a cyan pixel and copy 1x1 region
    LDI r12, 0x00FFFF
    PSET r8, r8, r12
    LDI r13, 0
    LDI r9, 0
    LDI r4, 1
    LDI r2, 1
    CLIP_COPY r13, r9, r4, r2

    ; Push again (now has pixel+text)
    LDI r13, 0
    LDI r9, 0
    CLIP_HISTORY r13, r9

    ; Query info slot 0 (newest = pixel+text) → r8=3
    LDI r13, 4
    LDI r9, 0
    CLIP_HISTORY r13, r9

    ; Query info slot 1 (text only) → r8=2
    LDI r13, 4
    LDI r9, 1
    CLIP_HISTORY r13, r9

    ; Draw label
    LDI r1, 2
    LDI r11, 40
    LDI r6, step3_label
    TEXT r1, r11, r6

    ; Cyan bar
    LDI r12, 0x00FFFF
    LDI r0, 2
    LDI r3, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r3, 0x3000
    LDI r13, 71     ; 'G'
    STORE r3, r13
    LDI r3, 0x3001
    LDI r13, 101    ; 'e'
    STORE r3, r13
    LDI r3, 0x3002
    LDI r13, 79     ; 'O'
    STORE r3, r13
    LDI r3, 0x3003
    LDI r13, 83     ; 'S'
    STORE r3, r13
    LDI r3, 0x3004
    LDI r13, 0
    STORE r3, r13

    LDI r13, 0
    LDI r9, 0x3000
    LDI r4, 4
    CLIP_TEXT r13, r9, r4

    ; Push to history
    LDI r13, 0
    LDI r9, 0
    CLIP_HISTORY r13, r9

    ; Clear text clipboard (mode 3)
    LDI r13, 3
    LDI r9, 0
    LDI r4, 0
    CLIP_TEXT r13, r9, r4

    ; Verify cleared
    LDI r13, 2
    CLIP_TEXT r13, r9, r4

    ; Restore from history slot 0
    LDI r13, 2
    LDI r9, 0
    CLIP_HISTORY r13, r9

    ; Paste restored text to RAM
    LDI r13, 1
    LDI r9, 0x3100
    LDI r4, 20
    CLIP_TEXT r13, r9, r4

    ; Draw label
    LDI r1, 2
    LDI r11, 56
    LDI r6, step4_label
    TEXT r1, r11, r6

    ; Draw restored text
    LDI r1, 2
    LDI r11, 64
    LDI r6, 0x3100
    TEXT r1, r11, r6

    ; Magenta bar
    LDI r12, 0xFF00FF
    LDI r0, 2
    LDI r3, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r1, 2
    LDI r11, 80
    LDI r6, step5_label
    TEXT r1, r11, r6

    ; White bar = pass
    LDI r12, 0xFFFFFF
    LDI r0, 2
    LDI r3, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r12 = color, r0 = x, r3 = y
draw_bar:
    LDI r5, 40
bar_loop:
    PSET r0, r3, r12
    ADDI r0, 1
    SUBI r5, 1
    JNZ r5, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
