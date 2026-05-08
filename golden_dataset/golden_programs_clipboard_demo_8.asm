; DESCRIPTION: This GeOS assembly code demonstrates a multi-format clipboard and history system, showcasing functionalities such as storing and pasting text, pushing snapshots to history, handling ring buffer overflow with an 8-slot capacity, and clearing the history. It visually verifies these operations through colored bars representing different states.

; ── clipboard_demo.asm ─────────────────────────────────────────────
; Phase 221: Multi-Format Clipboard & History Demo
;
; Demonstrates:
;   1. Text clipboard: store/paste strings via CLIP_TEXT (0xDD)
;   2. History: push snapshots, restore from history via CLIP_HISTORY (0xDF)
;   3. Ring buffer overflow behavior (8-slot cap)
;
; Visual verification: colored bars show clipboard state at each step
; ──────────────────────────────────────────────────────────────────

start:
    ; ── Clear screen ──
    LDI r0, 0
    FILL r0

    ; ── Title bar ──
    LDI r4, 2
    LDI r1, 0
    LDI r13, title
    TEXT r4, r1, r13

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r7, 0x3000
    LDI r9, 72            ; 'H'
    STORE r7, r9
    LDI r7, 0x3001
    LDI r9, 101           ; 'e'
    STORE r7, r9
    LDI r7, 0x3002
    LDI r9, 108           ; 'l'
    STORE r7, r9
    LDI r7, 0x3003
    LDI r9, 108           ; 'l'
    STORE r7, r9
    LDI r7, 0x3004
    LDI r9, 111           ; 'o'
    STORE r7, r9
    LDI r7, 0x3005
    LDI r9, 0             ; null terminator
    STORE r7, r9

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r9, 0             ; mode: store
    LDI r5, 0x3000        ; source addr
    LDI r2, 5             ; length
    CLIP_TEXT r9, r5, r2

    ; Draw label for step 1
    LDI r4, 2
    LDI r1, 16
    LDI r13, step1_label
    TEXT r4, r1, r13

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r9, 1             ; mode: paste
    LDI r5, 0x3100        ; dest addr
    LDI r2, 20            ; max len
    CLIP_TEXT r9, r5, r2
    LDI r4, 2
    LDI r1, 24
    LDI r13, 0x3100
    TEXT r4, r1, r13

    ; Visual indicator bar (green = text stored)
    LDI r10, 0x00FF00
    LDI r6, 2
    LDI r7, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r9, 0             ; mode: push
    LDI r5, 0             ; slot (unused for push)
    CLIP_HISTORY r9, r5

    ; Write "World" to RAM at 0x3000
    LDI r7, 0x3000
    LDI r9, 87            ; 'W'
    STORE r7, r9
    LDI r7, 0x3001
    LDI r9, 111           ; 'o'
    STORE r7, r9
    LDI r7, 0x3002
    LDI r9, 114           ; 'r'
    STORE r7, r9
    LDI r7, 0x3003
    LDI r9, 108           ; 'l'
    STORE r7, r9
    LDI r7, 0x3004
    LDI r9, 100           ; 'd'
    STORE r7, r9
    LDI r7, 0x3005
    LDI r9, 0
    STORE r7, r9

    ; Store "World" in text clipboard
    LDI r9, 0
    LDI r5, 0x3000
    LDI r2, 5
    CLIP_TEXT r9, r5, r2

    ; Draw label for step 2
    LDI r4, 2
    LDI r1, 48
    LDI r13, step2_label
    TEXT r4, r1, r13

    ; Paste "World"
    LDI r9, 1
    LDI r5, 0x3100
    LDI r2, 20
    CLIP_TEXT r9, r5, r2
    LDI r4, 2
    LDI r1, 56
    LDI r13, 0x3100
    TEXT r4, r1, r13

    ; Visual indicator bar (yellow = history + new text)
    LDI r10, 0xFFFF00
    LDI r6, 2
    LDI r7, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r9, 2             ; mode: restore
    LDI r5, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r9, r5

    ; Draw label for step 3
    LDI r4, 2
    LDI r1, 80
    LDI r13, step3_label
    TEXT r4, r1, r13

    ; Paste restored text
    LDI r9, 1
    LDI r5, 0x3100
    LDI r2, 20
    CLIP_TEXT r9, r5, r2
    LDI r4, 2
    LDI r1, 88
    LDI r13, 0x3100
    TEXT r4, r1, r13

    ; Visual indicator bar (cyan = restored)
    LDI r10, 0x00FFFF
    LDI r6, 2
    LDI r7, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r3, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r7, 0x3000
    LDI r9, 48            ; '0'
    ADD r9, r3
    STORE r7, r9
    LDI r7, 0x3001
    LDI r9, 0
    STORE r7, r9

    ; Store in text clipboard
    LDI r9, 0
    LDI r5, 0x3000
    LDI r2, 1
    CLIP_TEXT r9, r5, r2

    ; Push to history
    LDI r9, 0
    LDI r5, 0
    CLIP_HISTORY r9, r5

    ADDI r3, 1
    LDI r11, 10
    CMP r3, r11
    BLT r0, fill_loop

    ; Draw label for step 4
    LDI r4, 2
    LDI r1, 112
    LDI r13, step4_label
    TEXT r4, r1, r13

    ; Restore oldest surviving entry (should be "2")
    LDI r9, 2             ; restore
    LDI r5, 7             ; oldest slot
    CLIP_HISTORY r9, r5

    LDI r9, 1
    LDI r5, 0x3100
    LDI r2, 20
    CLIP_TEXT r9, r5, r2
    LDI r4, 2
    LDI r1, 120
    LDI r13, 0x3100
    TEXT r4, r1, r13

    ; Visual indicator bar (magenta = ring buffer)
    LDI r10, 0xFF00FF
    LDI r6, 2
    LDI r7, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r9, 3             ; mode: clear
    LDI r5, 0
    CLIP_HISTORY r9, r5

    ; Draw label for step 5
    LDI r4, 2
    LDI r1, 144
    LDI r13, step5_label
    TEXT r4, r1, r13

    ; Visual indicator bar (white = cleared)
    LDI r10, 0xFFFFFF
    LDI r6, 2
    LDI r7, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r10 = color, r6 = x, r7 = y
draw_bar:
    LDI r12, 40           ; width
bar_loop:
    PSET r6, r7, r10
    ADDI r6, 1
    SUBI r12, 1
    JNZ r12, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
