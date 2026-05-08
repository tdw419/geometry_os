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
    LDI r8, 0
    FILL r8

    ; ── Title bar ──
    LDI r5, 2
    LDI r1, 0
    LDI r15, title
    TEXT r5, r1, r15

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r13, 0x3000
    LDI r2, 72            ; 'H'
    STORE r13, r2
    LDI r13, 0x3001
    LDI r2, 101           ; 'e'
    STORE r13, r2
    LDI r13, 0x3002
    LDI r2, 108           ; 'l'
    STORE r13, r2
    LDI r13, 0x3003
    LDI r2, 108           ; 'l'
    STORE r13, r2
    LDI r13, 0x3004
    LDI r2, 111           ; 'o'
    STORE r13, r2
    LDI r13, 0x3005
    LDI r2, 0             ; null terminator
    STORE r13, r2

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r2, 0             ; mode: store
    LDI r6, 0x3000        ; source addr
    LDI r9, 5             ; length
    CLIP_TEXT r2, r6, r9

    ; Draw label for step 1
    LDI r5, 2
    LDI r1, 16
    LDI r15, step1_label
    TEXT r5, r1, r15

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r2, 1             ; mode: paste
    LDI r6, 0x3100        ; dest addr
    LDI r9, 20            ; max len
    CLIP_TEXT r2, r6, r9
    LDI r5, 2
    LDI r1, 24
    LDI r15, 0x3100
    TEXT r5, r1, r15

    ; Visual indicator bar (green = text stored)
    LDI r3, 0x00FF00
    LDI r14, 2
    LDI r13, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r2, 0             ; mode: push
    LDI r6, 0             ; slot (unused for push)
    CLIP_HISTORY r2, r6

    ; Write "World" to RAM at 0x3000
    LDI r13, 0x3000
    LDI r2, 87            ; 'W'
    STORE r13, r2
    LDI r13, 0x3001
    LDI r2, 111           ; 'o'
    STORE r13, r2
    LDI r13, 0x3002
    LDI r2, 114           ; 'r'
    STORE r13, r2
    LDI r13, 0x3003
    LDI r2, 108           ; 'l'
    STORE r13, r2
    LDI r13, 0x3004
    LDI r2, 100           ; 'd'
    STORE r13, r2
    LDI r13, 0x3005
    LDI r2, 0
    STORE r13, r2

    ; Store "World" in text clipboard
    LDI r2, 0
    LDI r6, 0x3000
    LDI r9, 5
    CLIP_TEXT r2, r6, r9

    ; Draw label for step 2
    LDI r5, 2
    LDI r1, 48
    LDI r15, step2_label
    TEXT r5, r1, r15

    ; Paste "World"
    LDI r2, 1
    LDI r6, 0x3100
    LDI r9, 20
    CLIP_TEXT r2, r6, r9
    LDI r5, 2
    LDI r1, 56
    LDI r15, 0x3100
    TEXT r5, r1, r15

    ; Visual indicator bar (yellow = history + new text)
    LDI r3, 0xFFFF00
    LDI r14, 2
    LDI r13, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r2, 2             ; mode: restore
    LDI r6, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r2, r6

    ; Draw label for step 3
    LDI r5, 2
    LDI r1, 80
    LDI r15, step3_label
    TEXT r5, r1, r15

    ; Paste restored text
    LDI r2, 1
    LDI r6, 0x3100
    LDI r9, 20
    CLIP_TEXT r2, r6, r9
    LDI r5, 2
    LDI r1, 88
    LDI r15, 0x3100
    TEXT r5, r1, r15

    ; Visual indicator bar (cyan = restored)
    LDI r3, 0x00FFFF
    LDI r14, 2
    LDI r13, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r11, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r13, 0x3000
    LDI r2, 48            ; '0'
    ADD r2, r11
    STORE r13, r2
    LDI r13, 0x3001
    LDI r2, 0
    STORE r13, r2

    ; Store in text clipboard
    LDI r2, 0
    LDI r6, 0x3000
    LDI r9, 1
    CLIP_TEXT r2, r6, r9

    ; Push to history
    LDI r2, 0
    LDI r6, 0
    CLIP_HISTORY r2, r6

    ADDI r11, 1
    LDI r0, 10
    CMP r11, r0
    BLT r8, fill_loop

    ; Draw label for step 4
    LDI r5, 2
    LDI r1, 112
    LDI r15, step4_label
    TEXT r5, r1, r15

    ; Restore oldest surviving entry (should be "2")
    LDI r2, 2             ; restore
    LDI r6, 7             ; oldest slot
    CLIP_HISTORY r2, r6

    LDI r2, 1
    LDI r6, 0x3100
    LDI r9, 20
    CLIP_TEXT r2, r6, r9
    LDI r5, 2
    LDI r1, 120
    LDI r15, 0x3100
    TEXT r5, r1, r15

    ; Visual indicator bar (magenta = ring buffer)
    LDI r3, 0xFF00FF
    LDI r14, 2
    LDI r13, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r2, 3             ; mode: clear
    LDI r6, 0
    CLIP_HISTORY r2, r6

    ; Draw label for step 5
    LDI r5, 2
    LDI r1, 144
    LDI r15, step5_label
    TEXT r5, r1, r15

    ; Visual indicator bar (white = cleared)
    LDI r3, 0xFFFFFF
    LDI r14, 2
    LDI r13, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r3 = color, r14 = x, r13 = y
draw_bar:
    LDI r4, 40           ; width
bar_loop:
    PSET r14, r13, r3
    ADDI r14, 1
    SUBI r4, 1
    JNZ r4, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
