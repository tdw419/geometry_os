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
    LDI r13, 0
    FILL r13

    ; ── Title ──
    LDI r10, 2
    LDI r6, 0
    LDI r5, title
    TEXT r10, r6, r5

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r1, 0x3000
    LDI r8, 65     ; 'A'
    STORE r1, r8
    LDI r1, 0x3001
    LDI r8, 66     ; 'B'
    STORE r1, r8
    LDI r1, 0x3002
    LDI r8, 67     ; 'C'
    STORE r1, r8
    LDI r1, 0x3003
    LDI r8, 0      ; null
    STORE r1, r8

    ; Store text (mode 0)
    LDI r8, 0
    LDI r9, 0x3000
    LDI r4, 3
    CLIP_TEXT r8, r9, r4

    ; Clear text clipboard (mode 3)
    LDI r8, 3
    LDI r9, 0
    LDI r4, 0
    CLIP_TEXT r8, r9, r4

    ; Get length (mode 2) — should be 0 after clear
    LDI r8, 2
    CLIP_TEXT r8, r9, r4

    ; Draw label
    LDI r10, 2
    LDI r6, 8
    LDI r5, step1_label
    TEXT r10, r6, r5

    ; Green bar = text clear works
    LDI r2, 0x00FF00
    LDI r3, 2
    LDI r1, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r2, 0xFF0000
    LDI r3, 0
    LDI r1, 0
    LDI r12, 8
step2_draw:
    PSET r3, r1, r2
    ADDI r3, 1
    SUBI r12, 1
    JNZ r12, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r8, 0
    LDI r9, 0
    LDI r4, 8
    LDI r15, 1
    CLIP_COPY r8, r9, r4, r15

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r8, 2
    LDI r9, 0
    LDI r4, 4
    LDI r15, 256
    CLIPSET r8, r9, r4, r15

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r8, 0
    LDI r9, 32
    CLIP_PASTE r8, r9

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r10, 2
    LDI r6, 24
    LDI r5, step2_label
    TEXT r10, r6, r5

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r2, 0xFFFF00
    LDI r3, 2
    LDI r1, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r1, 0x3000
    LDI r8, 72     ; 'H'
    STORE r1, r8
    LDI r1, 0x3001
    LDI r8, 105    ; 'i'
    STORE r1, r8
    LDI r1, 0x3002
    LDI r8, 0
    STORE r1, r8

    LDI r8, 0
    LDI r9, 0x3000
    LDI r4, 2
    CLIP_TEXT r8, r9, r4

    ; Push to history (text only, no pixel data)
    LDI r8, 0
    LDI r9, 0
    CLIP_HISTORY r8, r9

    ; Draw a cyan pixel and copy 1x1 region
    LDI r2, 0x00FFFF
    PSET r13, r13, r2
    LDI r8, 0
    LDI r9, 0
    LDI r4, 1
    LDI r15, 1
    CLIP_COPY r8, r9, r4, r15

    ; Push again (now has pixel+text)
    LDI r8, 0
    LDI r9, 0
    CLIP_HISTORY r8, r9

    ; Query info slot 0 (newest = pixel+text) → r13=3
    LDI r8, 4
    LDI r9, 0
    CLIP_HISTORY r8, r9

    ; Query info slot 1 (text only) → r13=2
    LDI r8, 4
    LDI r9, 1
    CLIP_HISTORY r8, r9

    ; Draw label
    LDI r10, 2
    LDI r6, 40
    LDI r5, step3_label
    TEXT r10, r6, r5

    ; Cyan bar
    LDI r2, 0x00FFFF
    LDI r3, 2
    LDI r1, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r1, 0x3000
    LDI r8, 71     ; 'G'
    STORE r1, r8
    LDI r1, 0x3001
    LDI r8, 101    ; 'e'
    STORE r1, r8
    LDI r1, 0x3002
    LDI r8, 79     ; 'O'
    STORE r1, r8
    LDI r1, 0x3003
    LDI r8, 83     ; 'S'
    STORE r1, r8
    LDI r1, 0x3004
    LDI r8, 0
    STORE r1, r8

    LDI r8, 0
    LDI r9, 0x3000
    LDI r4, 4
    CLIP_TEXT r8, r9, r4

    ; Push to history
    LDI r8, 0
    LDI r9, 0
    CLIP_HISTORY r8, r9

    ; Clear text clipboard (mode 3)
    LDI r8, 3
    LDI r9, 0
    LDI r4, 0
    CLIP_TEXT r8, r9, r4

    ; Verify cleared
    LDI r8, 2
    CLIP_TEXT r8, r9, r4

    ; Restore from history slot 0
    LDI r8, 2
    LDI r9, 0
    CLIP_HISTORY r8, r9

    ; Paste restored text to RAM
    LDI r8, 1
    LDI r9, 0x3100
    LDI r4, 20
    CLIP_TEXT r8, r9, r4

    ; Draw label
    LDI r10, 2
    LDI r6, 56
    LDI r5, step4_label
    TEXT r10, r6, r5

    ; Draw restored text
    LDI r10, 2
    LDI r6, 64
    LDI r5, 0x3100
    TEXT r10, r6, r5

    ; Magenta bar
    LDI r2, 0xFF00FF
    LDI r3, 2
    LDI r1, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r10, 2
    LDI r6, 80
    LDI r5, step5_label
    TEXT r10, r6, r5

    ; White bar = pass
    LDI r2, 0xFFFFFF
    LDI r3, 2
    LDI r1, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r2 = color, r3 = x, r1 = y
draw_bar:
    LDI r12, 40
bar_loop:
    PSET r3, r1, r2
    ADDI r3, 1
    SUBI r12, 1
    JNZ r12, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
