; DESCRIPTION: Display a object using color red at the screen.

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
    LDI r2, 0
    FILL r2

    ; ── Title bar ──
    LDI r5, 2
    LDI r13, 0
    LDI r3, title
    TEXT r5, r13, r3

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r0, 0x3000
    LDI r7, 72            ; 'H'
    STORE r0, r7
    LDI r0, 0x3001
    LDI r7, 101           ; 'e'
    STORE r0, r7
    LDI r0, 0x3002
    LDI r7, 108           ; 'l'
    STORE r0, r7
    LDI r0, 0x3003
    LDI r7, 108           ; 'l'
    STORE r0, r7
    LDI r0, 0x3004
    LDI r7, 111           ; 'o'
    STORE r0, r7
    LDI r0, 0x3005
    LDI r7, 0             ; null terminator
    STORE r0, r7

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r7, 0             ; mode: store
    LDI r11, 0x3000        ; source addr
    LDI r15, 5             ; length
    CLIP_TEXT r7, r11, r15

    ; Draw label for step 1
    LDI r5, 2
    LDI r13, 16
    LDI r3, step1_label
    TEXT r5, r13, r3

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r7, 1             ; mode: paste
    LDI r11, 0x3100        ; dest addr
    LDI r15, 20            ; max len
    CLIP_TEXT r7, r11, r15
    LDI r5, 2
    LDI r13, 24
    LDI r3, 0x3100
    TEXT r5, r13, r3

    ; Visual indicator bar (green = text stored)
    LDI r1, 0x00FF00
    LDI r12, 2
    LDI r0, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r7, 0             ; mode: push
    LDI r11, 0             ; slot (unused for push)
    CLIP_HISTORY r7, r11

    ; Write "World" to RAM at 0x3000
    LDI r0, 0x3000
    LDI r7, 87            ; 'W'
    STORE r0, r7
    LDI r0, 0x3001
    LDI r7, 111           ; 'o'
    STORE r0, r7
    LDI r0, 0x3002
    LDI r7, 114           ; 'r'
    STORE r0, r7
    LDI r0, 0x3003
    LDI r7, 108           ; 'l'
    STORE r0, r7
    LDI r0, 0x3004
    LDI r7, 100           ; 'd'
    STORE r0, r7
    LDI r0, 0x3005
    LDI r7, 0
    STORE r0, r7

    ; Store "World" in text clipboard
    LDI r7, 0
    LDI r11, 0x3000
    LDI r15, 5
    CLIP_TEXT r7, r11, r15

    ; Draw label for step 2
    LDI r5, 2
    LDI r13, 48
    LDI r3, step2_label
    TEXT r5, r13, r3

    ; Paste "World"
    LDI r7, 1
    LDI r11, 0x3100
    LDI r15, 20
    CLIP_TEXT r7, r11, r15
    LDI r5, 2
    LDI r13, 56
    LDI r3, 0x3100
    TEXT r5, r13, r3

    ; Visual indicator bar (yellow = history + new text)
    LDI r1, 0xFFFF00
    LDI r12, 2
    LDI r0, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r7, 2             ; mode: restore
    LDI r11, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r7, r11

    ; Draw label for step 3
    LDI r5, 2
    LDI r13, 80
    LDI r3, step3_label
    TEXT r5, r13, r3

    ; Paste restored text
    LDI r7, 1
    LDI r11, 0x3100
    LDI r15, 20
    CLIP_TEXT r7, r11, r15
    LDI r5, 2
    LDI r13, 88
    LDI r3, 0x3100
    TEXT r5, r13, r3

    ; Visual indicator bar (cyan = restored)
    LDI r1, 0x00FFFF
    LDI r12, 2
    LDI r0, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r10, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r0, 0x3000
    LDI r7, 48            ; '0'
    ADD r7, r10
    STORE r0, r7
    LDI r0, 0x3001
    LDI r7, 0
    STORE r0, r7

    ; Store in text clipboard
    LDI r7, 0
    LDI r11, 0x3000
    LDI r15, 1
    CLIP_TEXT r7, r11, r15

    ; Push to history
    LDI r7, 0
    LDI r11, 0
    CLIP_HISTORY r7, r11

    ADDI r10, 1
    LDI r14, 10
    CMP r10, r14
    BLT r2, fill_loop

    ; Draw label for step 4
    LDI r5, 2
    LDI r13, 112
    LDI r3, step4_label
    TEXT r5, r13, r3

    ; Restore oldest surviving entry (should be "2")
    LDI r7, 2             ; restore
    LDI r11, 7             ; oldest slot
    CLIP_HISTORY r7, r11

    LDI r7, 1
    LDI r11, 0x3100
    LDI r15, 20
    CLIP_TEXT r7, r11, r15
    LDI r5, 2
    LDI r13, 120
    LDI r3, 0x3100
    TEXT r5, r13, r3

    ; Visual indicator bar (magenta = ring buffer)
    LDI r1, 0xFF00FF
    LDI r12, 2
    LDI r0, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r7, 3             ; mode: clear
    LDI r11, 0
    CLIP_HISTORY r7, r11

    ; Draw label for step 5
    LDI r5, 2
    LDI r13, 144
    LDI r3, step5_label
    TEXT r5, r13, r3

    ; Visual indicator bar (white = cleared)
    LDI r1, 0xFFFFFF
    LDI r12, 2
    LDI r0, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r1 = color, r12 = x, r0 = y
draw_bar:
    LDI r8, 40           ; width
bar_loop:
    PSET r12, r0, r1
    ADDI r12, 1
    SUBI r8, 1
    JNZ r8, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
