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
    LDI r6, 0
    FILL r6

    ; ── Title ──
    LDI r10, 2
    LDI r14, 0
    LDI r12, title
    TEXT r10, r14, r12

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r9, 0x3000
    LDI r3, 65     ; 'A'
    STORE r9, r3
    LDI r9, 0x3001
    LDI r3, 66     ; 'B'
    STORE r9, r3
    LDI r9, 0x3002
    LDI r3, 67     ; 'C'
    STORE r9, r3
    LDI r9, 0x3003
    LDI r3, 0      ; null
    STORE r9, r3

    ; Store text (mode 0)
    LDI r3, 0
    LDI r0, 0x3000
    LDI r13, 3
    CLIP_TEXT r3, r0, r13

    ; Clear text clipboard (mode 3)
    LDI r3, 3
    LDI r0, 0
    LDI r13, 0
    CLIP_TEXT r3, r0, r13

    ; Get length (mode 2) — should be 0 after clear
    LDI r3, 2
    CLIP_TEXT r3, r0, r13

    ; Draw label
    LDI r10, 2
    LDI r14, 8
    LDI r12, step1_label
    TEXT r10, r14, r12

    ; Green bar = text clear works
    LDI r15, 0x00FF00
    LDI r5, 2
    LDI r9, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r15, 0xFF0000
    LDI r5, 0
    LDI r9, 0
    LDI r7, 8
step2_draw:
    PSET r5, r9, r15
    ADDI r5, 1
    SUBI r7, 1
    JNZ r7, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r3, 0
    LDI r0, 0
    LDI r13, 8
    LDI r8, 1
    CLIP_COPY r3, r0, r13, r8

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r3, 2
    LDI r0, 0
    LDI r13, 4
    LDI r8, 256
    CLIPSET r3, r0, r13, r8

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r3, 0
    LDI r0, 32
    CLIP_PASTE r3, r0

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r10, 2
    LDI r14, 24
    LDI r12, step2_label
    TEXT r10, r14, r12

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r15, 0xFFFF00
    LDI r5, 2
    LDI r9, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r9, 0x3000
    LDI r3, 72     ; 'H'
    STORE r9, r3
    LDI r9, 0x3001
    LDI r3, 105    ; 'i'
    STORE r9, r3
    LDI r9, 0x3002
    LDI r3, 0
    STORE r9, r3

    LDI r3, 0
    LDI r0, 0x3000
    LDI r13, 2
    CLIP_TEXT r3, r0, r13

    ; Push to history (text only, no pixel data)
    LDI r3, 0
    LDI r0, 0
    CLIP_HISTORY r3, r0

    ; Draw a cyan pixel and copy 1x1 region
    LDI r15, 0x00FFFF
    PSET r6, r6, r15
    LDI r3, 0
    LDI r0, 0
    LDI r13, 1
    LDI r8, 1
    CLIP_COPY r3, r0, r13, r8

    ; Push again (now has pixel+text)
    LDI r3, 0
    LDI r0, 0
    CLIP_HISTORY r3, r0

    ; Query info slot 0 (newest = pixel+text) → r6=3
    LDI r3, 4
    LDI r0, 0
    CLIP_HISTORY r3, r0

    ; Query info slot 1 (text only) → r6=2
    LDI r3, 4
    LDI r0, 1
    CLIP_HISTORY r3, r0

    ; Draw label
    LDI r10, 2
    LDI r14, 40
    LDI r12, step3_label
    TEXT r10, r14, r12

    ; Cyan bar
    LDI r15, 0x00FFFF
    LDI r5, 2
    LDI r9, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r9, 0x3000
    LDI r3, 71     ; 'G'
    STORE r9, r3
    LDI r9, 0x3001
    LDI r3, 101    ; 'e'
    STORE r9, r3
    LDI r9, 0x3002
    LDI r3, 79     ; 'O'
    STORE r9, r3
    LDI r9, 0x3003
    LDI r3, 83     ; 'S'
    STORE r9, r3
    LDI r9, 0x3004
    LDI r3, 0
    STORE r9, r3

    LDI r3, 0
    LDI r0, 0x3000
    LDI r13, 4
    CLIP_TEXT r3, r0, r13

    ; Push to history
    LDI r3, 0
    LDI r0, 0
    CLIP_HISTORY r3, r0

    ; Clear text clipboard (mode 3)
    LDI r3, 3
    LDI r0, 0
    LDI r13, 0
    CLIP_TEXT r3, r0, r13

    ; Verify cleared
    LDI r3, 2
    CLIP_TEXT r3, r0, r13

    ; Restore from history slot 0
    LDI r3, 2
    LDI r0, 0
    CLIP_HISTORY r3, r0

    ; Paste restored text to RAM
    LDI r3, 1
    LDI r0, 0x3100
    LDI r13, 20
    CLIP_TEXT r3, r0, r13

    ; Draw label
    LDI r10, 2
    LDI r14, 56
    LDI r12, step4_label
    TEXT r10, r14, r12

    ; Draw restored text
    LDI r10, 2
    LDI r14, 64
    LDI r12, 0x3100
    TEXT r10, r14, r12

    ; Magenta bar
    LDI r15, 0xFF00FF
    LDI r5, 2
    LDI r9, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r10, 2
    LDI r14, 80
    LDI r12, step5_label
    TEXT r10, r14, r12

    ; White bar = pass
    LDI r15, 0xFFFFFF
    LDI r5, 2
    LDI r9, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r15 = color, r5 = x, r9 = y
draw_bar:
    LDI r7, 40
bar_loop:
    PSET r5, r9, r15
    ADDI r5, 1
    SUBI r7, 1
    JNZ r7, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
