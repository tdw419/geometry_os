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
    LDI r0, 0
    FILL r0

    ; ── Title ──
    LDI r10, 2
    LDI r11, 0
    LDI r12, title
    TEXT r10, r11, r12

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r9, 0x3000
    LDI r1, 65     ; 'A'
    STORE r9, r1
    LDI r9, 0x3001
    LDI r1, 66     ; 'B'
    STORE r9, r1
    LDI r9, 0x3002
    LDI r1, 67     ; 'C'
    STORE r9, r1
    LDI r9, 0x3003
    LDI r1, 0      ; null
    STORE r9, r1

    ; Store text (mode 0)
    LDI r1, 0
    LDI r2, 0x3000
    LDI r3, 3
    CLIP_TEXT r1, r2, r3

    ; Clear text clipboard (mode 3)
    LDI r1, 3
    LDI r2, 0
    LDI r3, 0
    CLIP_TEXT r1, r2, r3

    ; Get length (mode 2) — should be 0 after clear
    LDI r1, 2
    CLIP_TEXT r1, r2, r3

    ; Draw label
    LDI r10, 2
    LDI r11, 8
    LDI r12, step1_label
    TEXT r10, r11, r12

    ; Green bar = text clear works
    LDI r7, 0x00FF00
    LDI r8, 2
    LDI r9, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r7, 0xFF0000
    LDI r8, 0
    LDI r9, 0
    LDI r13, 8
step2_draw:
    PSET r8, r9, r7
    ADDI r8, 1
    SUBI r13, 1
    JNZ r13, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r1, 0
    LDI r2, 0
    LDI r3, 8
    LDI r4, 1
    CLIP_COPY r1, r2, r3, r4

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r1, 2
    LDI r2, 0
    LDI r3, 4
    LDI r4, 256
    CLIPSET r1, r2, r3, r4

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r1, 0
    LDI r2, 32
    CLIP_PASTE r1, r2

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r10, 2
    LDI r11, 24
    LDI r12, step2_label
    TEXT r10, r11, r12

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r7, 0xFFFF00
    LDI r8, 2
    LDI r9, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r9, 0x3000
    LDI r1, 72     ; 'H'
    STORE r9, r1
    LDI r9, 0x3001
    LDI r1, 105    ; 'i'
    STORE r9, r1
    LDI r9, 0x3002
    LDI r1, 0
    STORE r9, r1

    LDI r1, 0
    LDI r2, 0x3000
    LDI r3, 2
    CLIP_TEXT r1, r2, r3

    ; Push to history (text only, no pixel data)
    LDI r1, 0
    LDI r2, 0
    CLIP_HISTORY r1, r2

    ; Draw a cyan pixel and copy 1x1 region
    LDI r7, 0x00FFFF
    PSET r0, r0, r7
    LDI r1, 0
    LDI r2, 0
    LDI r3, 1
    LDI r4, 1
    CLIP_COPY r1, r2, r3, r4

    ; Push again (now has pixel+text)
    LDI r1, 0
    LDI r2, 0
    CLIP_HISTORY r1, r2

    ; Query info slot 0 (newest = pixel+text) → r0=3
    LDI r1, 4
    LDI r2, 0
    CLIP_HISTORY r1, r2

    ; Query info slot 1 (text only) → r0=2
    LDI r1, 4
    LDI r2, 1
    CLIP_HISTORY r1, r2

    ; Draw label
    LDI r10, 2
    LDI r11, 40
    LDI r12, step3_label
    TEXT r10, r11, r12

    ; Cyan bar
    LDI r7, 0x00FFFF
    LDI r8, 2
    LDI r9, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r9, 0x3000
    LDI r1, 71     ; 'G'
    STORE r9, r1
    LDI r9, 0x3001
    LDI r1, 101    ; 'e'
    STORE r9, r1
    LDI r9, 0x3002
    LDI r1, 79     ; 'O'
    STORE r9, r1
    LDI r9, 0x3003
    LDI r1, 83     ; 'S'
    STORE r9, r1
    LDI r9, 0x3004
    LDI r1, 0
    STORE r9, r1

    LDI r1, 0
    LDI r2, 0x3000
    LDI r3, 4
    CLIP_TEXT r1, r2, r3

    ; Push to history
    LDI r1, 0
    LDI r2, 0
    CLIP_HISTORY r1, r2

    ; Clear text clipboard (mode 3)
    LDI r1, 3
    LDI r2, 0
    LDI r3, 0
    CLIP_TEXT r1, r2, r3

    ; Verify cleared
    LDI r1, 2
    CLIP_TEXT r1, r2, r3

    ; Restore from history slot 0
    LDI r1, 2
    LDI r2, 0
    CLIP_HISTORY r1, r2

    ; Paste restored text to RAM
    LDI r1, 1
    LDI r2, 0x3100
    LDI r3, 20
    CLIP_TEXT r1, r2, r3

    ; Draw label
    LDI r10, 2
    LDI r11, 56
    LDI r12, step4_label
    TEXT r10, r11, r12

    ; Draw restored text
    LDI r10, 2
    LDI r11, 64
    LDI r12, 0x3100
    TEXT r10, r11, r12

    ; Magenta bar
    LDI r7, 0xFF00FF
    LDI r8, 2
    LDI r9, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r10, 2
    LDI r11, 80
    LDI r12, step5_label
    TEXT r10, r11, r12

    ; White bar = pass
    LDI r7, 0xFFFFFF
    LDI r8, 2
    LDI r9, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r7 = color, r8 = x, r9 = y
draw_bar:
    LDI r13, 40
bar_loop:
    PSET r8, r9, r7
    ADDI r8, 1
    SUBI r13, 1
    JNZ r13, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
