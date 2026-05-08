; DESCRIPTION: Render a red object at the screen.

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
    LDI r6, 2
    LDI r12, 0
    LDI r9, title
    TEXT r6, r12, r9

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r3, 0x3000
    LDI r14, 72            ; 'H'
    STORE r3, r14
    LDI r3, 0x3001
    LDI r14, 101           ; 'e'
    STORE r3, r14
    LDI r3, 0x3002
    LDI r14, 108           ; 'l'
    STORE r3, r14
    LDI r3, 0x3003
    LDI r14, 108           ; 'l'
    STORE r3, r14
    LDI r3, 0x3004
    LDI r14, 111           ; 'o'
    STORE r3, r14
    LDI r3, 0x3005
    LDI r14, 0             ; null terminator
    STORE r3, r14

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r14, 0             ; mode: store
    LDI r8, 0x3000        ; source addr
    LDI r13, 5             ; length
    CLIP_TEXT r14, r8, r13

    ; Draw label for step 1
    LDI r6, 2
    LDI r12, 16
    LDI r9, step1_label
    TEXT r6, r12, r9

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r14, 1             ; mode: paste
    LDI r8, 0x3100        ; dest addr
    LDI r13, 20            ; max len
    CLIP_TEXT r14, r8, r13
    LDI r6, 2
    LDI r12, 24
    LDI r9, 0x3100
    TEXT r6, r12, r9

    ; Visual indicator bar (green = text stored)
    LDI r11, 0x00FF00
    LDI r0, 2
    LDI r3, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r14, 0             ; mode: push
    LDI r8, 0             ; slot (unused for push)
    CLIP_HISTORY r14, r8

    ; Write "World" to RAM at 0x3000
    LDI r3, 0x3000
    LDI r14, 87            ; 'W'
    STORE r3, r14
    LDI r3, 0x3001
    LDI r14, 111           ; 'o'
    STORE r3, r14
    LDI r3, 0x3002
    LDI r14, 114           ; 'r'
    STORE r3, r14
    LDI r3, 0x3003
    LDI r14, 108           ; 'l'
    STORE r3, r14
    LDI r3, 0x3004
    LDI r14, 100           ; 'd'
    STORE r3, r14
    LDI r3, 0x3005
    LDI r14, 0
    STORE r3, r14

    ; Store "World" in text clipboard
    LDI r14, 0
    LDI r8, 0x3000
    LDI r13, 5
    CLIP_TEXT r14, r8, r13

    ; Draw label for step 2
    LDI r6, 2
    LDI r12, 48
    LDI r9, step2_label
    TEXT r6, r12, r9

    ; Paste "World"
    LDI r14, 1
    LDI r8, 0x3100
    LDI r13, 20
    CLIP_TEXT r14, r8, r13
    LDI r6, 2
    LDI r12, 56
    LDI r9, 0x3100
    TEXT r6, r12, r9

    ; Visual indicator bar (yellow = history + new text)
    LDI r11, 0xFFFF00
    LDI r0, 2
    LDI r3, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r14, 2             ; mode: restore
    LDI r8, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r14, r8

    ; Draw label for step 3
    LDI r6, 2
    LDI r12, 80
    LDI r9, step3_label
    TEXT r6, r12, r9

    ; Paste restored text
    LDI r14, 1
    LDI r8, 0x3100
    LDI r13, 20
    CLIP_TEXT r14, r8, r13
    LDI r6, 2
    LDI r12, 88
    LDI r9, 0x3100
    TEXT r6, r12, r9

    ; Visual indicator bar (cyan = restored)
    LDI r11, 0x00FFFF
    LDI r0, 2
    LDI r3, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r2, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r3, 0x3000
    LDI r14, 48            ; '0'
    ADD r14, r2
    STORE r3, r14
    LDI r3, 0x3001
    LDI r14, 0
    STORE r3, r14

    ; Store in text clipboard
    LDI r14, 0
    LDI r8, 0x3000
    LDI r13, 1
    CLIP_TEXT r14, r8, r13

    ; Push to history
    LDI r14, 0
    LDI r8, 0
    CLIP_HISTORY r14, r8

    ADDI r2, 1
    LDI r10, 10
    CMP r2, r10
    BLT r5, fill_loop

    ; Draw label for step 4
    LDI r6, 2
    LDI r12, 112
    LDI r9, step4_label
    TEXT r6, r12, r9

    ; Restore oldest surviving entry (should be "2")
    LDI r14, 2             ; restore
    LDI r8, 7             ; oldest slot
    CLIP_HISTORY r14, r8

    LDI r14, 1
    LDI r8, 0x3100
    LDI r13, 20
    CLIP_TEXT r14, r8, r13
    LDI r6, 2
    LDI r12, 120
    LDI r9, 0x3100
    TEXT r6, r12, r9

    ; Visual indicator bar (magenta = ring buffer)
    LDI r11, 0xFF00FF
    LDI r0, 2
    LDI r3, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r14, 3             ; mode: clear
    LDI r8, 0
    CLIP_HISTORY r14, r8

    ; Draw label for step 5
    LDI r6, 2
    LDI r12, 144
    LDI r9, step5_label
    TEXT r6, r12, r9

    ; Visual indicator bar (white = cleared)
    LDI r11, 0xFFFFFF
    LDI r0, 2
    LDI r3, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r11 = color, r0 = x, r3 = y
draw_bar:
    LDI r7, 40           ; width
bar_loop:
    PSET r0, r3, r11
    ADDI r0, 1
    SUBI r7, 1
    JNZ r7, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
