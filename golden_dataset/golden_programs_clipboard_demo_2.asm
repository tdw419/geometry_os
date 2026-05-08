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
    LDI r11, 0
    FILL r11

    ; ── Title bar ──
    LDI r2, 2
    LDI r8, 0
    LDI r13, title
    TEXT r2, r8, r13

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r15, 0x3000
    LDI r6, 72            ; 'H'
    STORE r15, r6
    LDI r15, 0x3001
    LDI r6, 101           ; 'e'
    STORE r15, r6
    LDI r15, 0x3002
    LDI r6, 108           ; 'l'
    STORE r15, r6
    LDI r15, 0x3003
    LDI r6, 108           ; 'l'
    STORE r15, r6
    LDI r15, 0x3004
    LDI r6, 111           ; 'o'
    STORE r15, r6
    LDI r15, 0x3005
    LDI r6, 0             ; null terminator
    STORE r15, r6

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r6, 0             ; mode: store
    LDI r14, 0x3000        ; source addr
    LDI r3, 5             ; length
    CLIP_TEXT r6, r14, r3

    ; Draw label for step 1
    LDI r2, 2
    LDI r8, 16
    LDI r13, step1_label
    TEXT r2, r8, r13

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r6, 1             ; mode: paste
    LDI r14, 0x3100        ; dest addr
    LDI r3, 20            ; max len
    CLIP_TEXT r6, r14, r3
    LDI r2, 2
    LDI r8, 24
    LDI r13, 0x3100
    TEXT r2, r8, r13

    ; Visual indicator bar (green = text stored)
    LDI r9, 0x00FF00
    LDI r0, 2
    LDI r15, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r6, 0             ; mode: push
    LDI r14, 0             ; slot (unused for push)
    CLIP_HISTORY r6, r14

    ; Write "World" to RAM at 0x3000
    LDI r15, 0x3000
    LDI r6, 87            ; 'W'
    STORE r15, r6
    LDI r15, 0x3001
    LDI r6, 111           ; 'o'
    STORE r15, r6
    LDI r15, 0x3002
    LDI r6, 114           ; 'r'
    STORE r15, r6
    LDI r15, 0x3003
    LDI r6, 108           ; 'l'
    STORE r15, r6
    LDI r15, 0x3004
    LDI r6, 100           ; 'd'
    STORE r15, r6
    LDI r15, 0x3005
    LDI r6, 0
    STORE r15, r6

    ; Store "World" in text clipboard
    LDI r6, 0
    LDI r14, 0x3000
    LDI r3, 5
    CLIP_TEXT r6, r14, r3

    ; Draw label for step 2
    LDI r2, 2
    LDI r8, 48
    LDI r13, step2_label
    TEXT r2, r8, r13

    ; Paste "World"
    LDI r6, 1
    LDI r14, 0x3100
    LDI r3, 20
    CLIP_TEXT r6, r14, r3
    LDI r2, 2
    LDI r8, 56
    LDI r13, 0x3100
    TEXT r2, r8, r13

    ; Visual indicator bar (yellow = history + new text)
    LDI r9, 0xFFFF00
    LDI r0, 2
    LDI r15, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r6, 2             ; mode: restore
    LDI r14, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r6, r14

    ; Draw label for step 3
    LDI r2, 2
    LDI r8, 80
    LDI r13, step3_label
    TEXT r2, r8, r13

    ; Paste restored text
    LDI r6, 1
    LDI r14, 0x3100
    LDI r3, 20
    CLIP_TEXT r6, r14, r3
    LDI r2, 2
    LDI r8, 88
    LDI r13, 0x3100
    TEXT r2, r8, r13

    ; Visual indicator bar (cyan = restored)
    LDI r9, 0x00FFFF
    LDI r0, 2
    LDI r15, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r7, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r15, 0x3000
    LDI r6, 48            ; '0'
    ADD r6, r7
    STORE r15, r6
    LDI r15, 0x3001
    LDI r6, 0
    STORE r15, r6

    ; Store in text clipboard
    LDI r6, 0
    LDI r14, 0x3000
    LDI r3, 1
    CLIP_TEXT r6, r14, r3

    ; Push to history
    LDI r6, 0
    LDI r14, 0
    CLIP_HISTORY r6, r14

    ADDI r7, 1
    LDI r1, 10
    CMP r7, r1
    BLT r11, fill_loop

    ; Draw label for step 4
    LDI r2, 2
    LDI r8, 112
    LDI r13, step4_label
    TEXT r2, r8, r13

    ; Restore oldest surviving entry (should be "2")
    LDI r6, 2             ; restore
    LDI r14, 7             ; oldest slot
    CLIP_HISTORY r6, r14

    LDI r6, 1
    LDI r14, 0x3100
    LDI r3, 20
    CLIP_TEXT r6, r14, r3
    LDI r2, 2
    LDI r8, 120
    LDI r13, 0x3100
    TEXT r2, r8, r13

    ; Visual indicator bar (magenta = ring buffer)
    LDI r9, 0xFF00FF
    LDI r0, 2
    LDI r15, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r6, 3             ; mode: clear
    LDI r14, 0
    CLIP_HISTORY r6, r14

    ; Draw label for step 5
    LDI r2, 2
    LDI r8, 144
    LDI r13, step5_label
    TEXT r2, r8, r13

    ; Visual indicator bar (white = cleared)
    LDI r9, 0xFFFFFF
    LDI r0, 2
    LDI r15, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r9 = color, r0 = x, r15 = y
draw_bar:
    LDI r5, 40           ; width
bar_loop:
    PSET r0, r15, r9
    ADDI r0, 1
    SUBI r5, 1
    JNZ r5, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
