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
    LDI r5, 0
    FILL r5

    ; ── Title bar ──
    LDI r0, 2
    LDI r2, 0
    LDI r1, title
    TEXT r0, r2, r1

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r12, 0x3000
    LDI r13, 72            ; 'H'
    STORE r12, r13
    LDI r12, 0x3001
    LDI r13, 101           ; 'e'
    STORE r12, r13
    LDI r12, 0x3002
    LDI r13, 108           ; 'l'
    STORE r12, r13
    LDI r12, 0x3003
    LDI r13, 108           ; 'l'
    STORE r12, r13
    LDI r12, 0x3004
    LDI r13, 111           ; 'o'
    STORE r12, r13
    LDI r12, 0x3005
    LDI r13, 0             ; null terminator
    STORE r12, r13

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r13, 0             ; mode: store
    LDI r4, 0x3000        ; source addr
    LDI r8, 5             ; length
    CLIP_TEXT r13, r4, r8

    ; Draw label for step 1
    LDI r0, 2
    LDI r2, 16
    LDI r1, step1_label
    TEXT r0, r2, r1

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r13, 1             ; mode: paste
    LDI r4, 0x3100        ; dest addr
    LDI r8, 20            ; max len
    CLIP_TEXT r13, r4, r8
    LDI r0, 2
    LDI r2, 24
    LDI r1, 0x3100
    TEXT r0, r2, r1

    ; Visual indicator bar (green = text stored)
    LDI r9, 0x00FF00
    LDI r6, 2
    LDI r12, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r13, 0             ; mode: push
    LDI r4, 0             ; slot (unused for push)
    CLIP_HISTORY r13, r4

    ; Write "World" to RAM at 0x3000
    LDI r12, 0x3000
    LDI r13, 87            ; 'W'
    STORE r12, r13
    LDI r12, 0x3001
    LDI r13, 111           ; 'o'
    STORE r12, r13
    LDI r12, 0x3002
    LDI r13, 114           ; 'r'
    STORE r12, r13
    LDI r12, 0x3003
    LDI r13, 108           ; 'l'
    STORE r12, r13
    LDI r12, 0x3004
    LDI r13, 100           ; 'd'
    STORE r12, r13
    LDI r12, 0x3005
    LDI r13, 0
    STORE r12, r13

    ; Store "World" in text clipboard
    LDI r13, 0
    LDI r4, 0x3000
    LDI r8, 5
    CLIP_TEXT r13, r4, r8

    ; Draw label for step 2
    LDI r0, 2
    LDI r2, 48
    LDI r1, step2_label
    TEXT r0, r2, r1

    ; Paste "World"
    LDI r13, 1
    LDI r4, 0x3100
    LDI r8, 20
    CLIP_TEXT r13, r4, r8
    LDI r0, 2
    LDI r2, 56
    LDI r1, 0x3100
    TEXT r0, r2, r1

    ; Visual indicator bar (yellow = history + new text)
    LDI r9, 0xFFFF00
    LDI r6, 2
    LDI r12, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r13, 2             ; mode: restore
    LDI r4, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r13, r4

    ; Draw label for step 3
    LDI r0, 2
    LDI r2, 80
    LDI r1, step3_label
    TEXT r0, r2, r1

    ; Paste restored text
    LDI r13, 1
    LDI r4, 0x3100
    LDI r8, 20
    CLIP_TEXT r13, r4, r8
    LDI r0, 2
    LDI r2, 88
    LDI r1, 0x3100
    TEXT r0, r2, r1

    ; Visual indicator bar (cyan = restored)
    LDI r9, 0x00FFFF
    LDI r6, 2
    LDI r12, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r11, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r12, 0x3000
    LDI r13, 48            ; '0'
    ADD r13, r11
    STORE r12, r13
    LDI r12, 0x3001
    LDI r13, 0
    STORE r12, r13

    ; Store in text clipboard
    LDI r13, 0
    LDI r4, 0x3000
    LDI r8, 1
    CLIP_TEXT r13, r4, r8

    ; Push to history
    LDI r13, 0
    LDI r4, 0
    CLIP_HISTORY r13, r4

    ADDI r11, 1
    LDI r3, 10
    CMP r11, r3
    BLT r5, fill_loop

    ; Draw label for step 4
    LDI r0, 2
    LDI r2, 112
    LDI r1, step4_label
    TEXT r0, r2, r1

    ; Restore oldest surviving entry (should be "2")
    LDI r13, 2             ; restore
    LDI r4, 7             ; oldest slot
    CLIP_HISTORY r13, r4

    LDI r13, 1
    LDI r4, 0x3100
    LDI r8, 20
    CLIP_TEXT r13, r4, r8
    LDI r0, 2
    LDI r2, 120
    LDI r1, 0x3100
    TEXT r0, r2, r1

    ; Visual indicator bar (magenta = ring buffer)
    LDI r9, 0xFF00FF
    LDI r6, 2
    LDI r12, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r13, 3             ; mode: clear
    LDI r4, 0
    CLIP_HISTORY r13, r4

    ; Draw label for step 5
    LDI r0, 2
    LDI r2, 144
    LDI r1, step5_label
    TEXT r0, r2, r1

    ; Visual indicator bar (white = cleared)
    LDI r9, 0xFFFFFF
    LDI r6, 2
    LDI r12, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r9 = color, r6 = x, r12 = y
draw_bar:
    LDI r15, 40           ; width
bar_loop:
    PSET r6, r12, r9
    ADDI r6, 1
    SUBI r15, 1
    JNZ r15, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
