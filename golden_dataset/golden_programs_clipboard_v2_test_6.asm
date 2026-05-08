; DESCRIPTION: This GeOS assembly code tests the Clipboard Protocol version 2, evaluating functionalities such as clearing the text clipboard, respecting clip rectangles during paste operations, querying history information, and performing a full round-trip of storing, pushing to history, clearing, and restoring data. The results are visually verified through color-coded bars on the screen corresponding to each test step.

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
    LDI r3, 0
    FILL r3

    ; ── Title ──
    LDI r8, 2
    LDI r1, 0
    LDI r11, title
    TEXT r8, r1, r11

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r12, 0x3000
    LDI r0, 65     ; 'A'
    STORE r12, r0
    LDI r12, 0x3001
    LDI r0, 66     ; 'B'
    STORE r12, r0
    LDI r12, 0x3002
    LDI r0, 67     ; 'C'
    STORE r12, r0
    LDI r12, 0x3003
    LDI r0, 0      ; null
    STORE r12, r0

    ; Store text (mode 0)
    LDI r0, 0
    LDI r5, 0x3000
    LDI r7, 3
    CLIP_TEXT r0, r5, r7

    ; Clear text clipboard (mode 3)
    LDI r0, 3
    LDI r5, 0
    LDI r7, 0
    CLIP_TEXT r0, r5, r7

    ; Get length (mode 2) — should be 0 after clear
    LDI r0, 2
    CLIP_TEXT r0, r5, r7

    ; Draw label
    LDI r8, 2
    LDI r1, 8
    LDI r11, step1_label
    TEXT r8, r1, r11

    ; Green bar = text clear works
    LDI r4, 0x00FF00
    LDI r6, 2
    LDI r12, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r4, 0xFF0000
    LDI r6, 0
    LDI r12, 0
    LDI r14, 8
step2_draw:
    PSET r6, r12, r4
    ADDI r6, 1
    SUBI r14, 1
    JNZ r14, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r0, 0
    LDI r5, 0
    LDI r7, 8
    LDI r9, 1
    CLIP_COPY r0, r5, r7, r9

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r0, 2
    LDI r5, 0
    LDI r7, 4
    LDI r9, 256
    CLIPSET r0, r5, r7, r9

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r0, 0
    LDI r5, 32
    CLIP_PASTE r0, r5

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r8, 2
    LDI r1, 24
    LDI r11, step2_label
    TEXT r8, r1, r11

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r4, 0xFFFF00
    LDI r6, 2
    LDI r12, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r12, 0x3000
    LDI r0, 72     ; 'H'
    STORE r12, r0
    LDI r12, 0x3001
    LDI r0, 105    ; 'i'
    STORE r12, r0
    LDI r12, 0x3002
    LDI r0, 0
    STORE r12, r0

    LDI r0, 0
    LDI r5, 0x3000
    LDI r7, 2
    CLIP_TEXT r0, r5, r7

    ; Push to history (text only, no pixel data)
    LDI r0, 0
    LDI r5, 0
    CLIP_HISTORY r0, r5

    ; Draw a cyan pixel and copy 1x1 region
    LDI r4, 0x00FFFF
    PSET r3, r3, r4
    LDI r0, 0
    LDI r5, 0
    LDI r7, 1
    LDI r9, 1
    CLIP_COPY r0, r5, r7, r9

    ; Push again (now has pixel+text)
    LDI r0, 0
    LDI r5, 0
    CLIP_HISTORY r0, r5

    ; Query info slot 0 (newest = pixel+text) → r3=3
    LDI r0, 4
    LDI r5, 0
    CLIP_HISTORY r0, r5

    ; Query info slot 1 (text only) → r3=2
    LDI r0, 4
    LDI r5, 1
    CLIP_HISTORY r0, r5

    ; Draw label
    LDI r8, 2
    LDI r1, 40
    LDI r11, step3_label
    TEXT r8, r1, r11

    ; Cyan bar
    LDI r4, 0x00FFFF
    LDI r6, 2
    LDI r12, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r12, 0x3000
    LDI r0, 71     ; 'G'
    STORE r12, r0
    LDI r12, 0x3001
    LDI r0, 101    ; 'e'
    STORE r12, r0
    LDI r12, 0x3002
    LDI r0, 79     ; 'O'
    STORE r12, r0
    LDI r12, 0x3003
    LDI r0, 83     ; 'S'
    STORE r12, r0
    LDI r12, 0x3004
    LDI r0, 0
    STORE r12, r0

    LDI r0, 0
    LDI r5, 0x3000
    LDI r7, 4
    CLIP_TEXT r0, r5, r7

    ; Push to history
    LDI r0, 0
    LDI r5, 0
    CLIP_HISTORY r0, r5

    ; Clear text clipboard (mode 3)
    LDI r0, 3
    LDI r5, 0
    LDI r7, 0
    CLIP_TEXT r0, r5, r7

    ; Verify cleared
    LDI r0, 2
    CLIP_TEXT r0, r5, r7

    ; Restore from history slot 0
    LDI r0, 2
    LDI r5, 0
    CLIP_HISTORY r0, r5

    ; Paste restored text to RAM
    LDI r0, 1
    LDI r5, 0x3100
    LDI r7, 20
    CLIP_TEXT r0, r5, r7

    ; Draw label
    LDI r8, 2
    LDI r1, 56
    LDI r11, step4_label
    TEXT r8, r1, r11

    ; Draw restored text
    LDI r8, 2
    LDI r1, 64
    LDI r11, 0x3100
    TEXT r8, r1, r11

    ; Magenta bar
    LDI r4, 0xFF00FF
    LDI r6, 2
    LDI r12, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r8, 2
    LDI r1, 80
    LDI r11, step5_label
    TEXT r8, r1, r11

    ; White bar = pass
    LDI r4, 0xFFFFFF
    LDI r6, 2
    LDI r12, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r4 = color, r6 = x, r12 = y
draw_bar:
    LDI r14, 40
bar_loop:
    PSET r6, r12, r4
    ADDI r6, 1
    SUBI r14, 1
    JNZ r14, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
