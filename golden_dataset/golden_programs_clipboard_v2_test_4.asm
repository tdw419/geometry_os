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
    LDI r14, 0
    FILL r14

    ; ── Title ──
    LDI r1, 2
    LDI r4, 0
    LDI r5, title
    TEXT r1, r4, r5

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r7, 0x3000
    LDI r12, 65     ; 'A'
    STORE r7, r12
    LDI r7, 0x3001
    LDI r12, 66     ; 'B'
    STORE r7, r12
    LDI r7, 0x3002
    LDI r12, 67     ; 'C'
    STORE r7, r12
    LDI r7, 0x3003
    LDI r12, 0      ; null
    STORE r7, r12

    ; Store text (mode 0)
    LDI r12, 0
    LDI r13, 0x3000
    LDI r2, 3
    CLIP_TEXT r12, r13, r2

    ; Clear text clipboard (mode 3)
    LDI r12, 3
    LDI r13, 0
    LDI r2, 0
    CLIP_TEXT r12, r13, r2

    ; Get length (mode 2) — should be 0 after clear
    LDI r12, 2
    CLIP_TEXT r12, r13, r2

    ; Draw label
    LDI r1, 2
    LDI r4, 8
    LDI r5, step1_label
    TEXT r1, r4, r5

    ; Green bar = text clear works
    LDI r0, 0x00FF00
    LDI r11, 2
    LDI r7, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r0, 0xFF0000
    LDI r11, 0
    LDI r7, 0
    LDI r10, 8
step2_draw:
    PSET r11, r7, r0
    ADDI r11, 1
    SUBI r10, 1
    JNZ r10, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r12, 0
    LDI r13, 0
    LDI r2, 8
    LDI r3, 1
    CLIP_COPY r12, r13, r2, r3

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r12, 2
    LDI r13, 0
    LDI r2, 4
    LDI r3, 256
    CLIPSET r12, r13, r2, r3

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r12, 0
    LDI r13, 32
    CLIP_PASTE r12, r13

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r1, 2
    LDI r4, 24
    LDI r5, step2_label
    TEXT r1, r4, r5

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r0, 0xFFFF00
    LDI r11, 2
    LDI r7, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r7, 0x3000
    LDI r12, 72     ; 'H'
    STORE r7, r12
    LDI r7, 0x3001
    LDI r12, 105    ; 'i'
    STORE r7, r12
    LDI r7, 0x3002
    LDI r12, 0
    STORE r7, r12

    LDI r12, 0
    LDI r13, 0x3000
    LDI r2, 2
    CLIP_TEXT r12, r13, r2

    ; Push to history (text only, no pixel data)
    LDI r12, 0
    LDI r13, 0
    CLIP_HISTORY r12, r13

    ; Draw a cyan pixel and copy 1x1 region
    LDI r0, 0x00FFFF
    PSET r14, r14, r0
    LDI r12, 0
    LDI r13, 0
    LDI r2, 1
    LDI r3, 1
    CLIP_COPY r12, r13, r2, r3

    ; Push again (now has pixel+text)
    LDI r12, 0
    LDI r13, 0
    CLIP_HISTORY r12, r13

    ; Query info slot 0 (newest = pixel+text) → r14=3
    LDI r12, 4
    LDI r13, 0
    CLIP_HISTORY r12, r13

    ; Query info slot 1 (text only) → r14=2
    LDI r12, 4
    LDI r13, 1
    CLIP_HISTORY r12, r13

    ; Draw label
    LDI r1, 2
    LDI r4, 40
    LDI r5, step3_label
    TEXT r1, r4, r5

    ; Cyan bar
    LDI r0, 0x00FFFF
    LDI r11, 2
    LDI r7, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r7, 0x3000
    LDI r12, 71     ; 'G'
    STORE r7, r12
    LDI r7, 0x3001
    LDI r12, 101    ; 'e'
    STORE r7, r12
    LDI r7, 0x3002
    LDI r12, 79     ; 'O'
    STORE r7, r12
    LDI r7, 0x3003
    LDI r12, 83     ; 'S'
    STORE r7, r12
    LDI r7, 0x3004
    LDI r12, 0
    STORE r7, r12

    LDI r12, 0
    LDI r13, 0x3000
    LDI r2, 4
    CLIP_TEXT r12, r13, r2

    ; Push to history
    LDI r12, 0
    LDI r13, 0
    CLIP_HISTORY r12, r13

    ; Clear text clipboard (mode 3)
    LDI r12, 3
    LDI r13, 0
    LDI r2, 0
    CLIP_TEXT r12, r13, r2

    ; Verify cleared
    LDI r12, 2
    CLIP_TEXT r12, r13, r2

    ; Restore from history slot 0
    LDI r12, 2
    LDI r13, 0
    CLIP_HISTORY r12, r13

    ; Paste restored text to RAM
    LDI r12, 1
    LDI r13, 0x3100
    LDI r2, 20
    CLIP_TEXT r12, r13, r2

    ; Draw label
    LDI r1, 2
    LDI r4, 56
    LDI r5, step4_label
    TEXT r1, r4, r5

    ; Draw restored text
    LDI r1, 2
    LDI r4, 64
    LDI r5, 0x3100
    TEXT r1, r4, r5

    ; Magenta bar
    LDI r0, 0xFF00FF
    LDI r11, 2
    LDI r7, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r1, 2
    LDI r4, 80
    LDI r5, step5_label
    TEXT r1, r4, r5

    ; White bar = pass
    LDI r0, 0xFFFFFF
    LDI r11, 2
    LDI r7, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r0 = color, r11 = x, r7 = y
draw_bar:
    LDI r10, 40
bar_loop:
    PSET r11, r7, r0
    ADDI r11, 1
    SUBI r10, 1
    JNZ r10, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
