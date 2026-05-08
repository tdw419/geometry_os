; DESCRIPTION: A red object centered at the screen with fixed size.

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
    LDI r7, 0
    FILL r7

    ; ── Title bar ──
    LDI r0, 2
    LDI r10, 0
    LDI r6, title
    TEXT r0, r10, r6

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r12, 0x3000
    LDI r15, 72            ; 'H'
    STORE r12, r15
    LDI r12, 0x3001
    LDI r15, 101           ; 'e'
    STORE r12, r15
    LDI r12, 0x3002
    LDI r15, 108           ; 'l'
    STORE r12, r15
    LDI r12, 0x3003
    LDI r15, 108           ; 'l'
    STORE r12, r15
    LDI r12, 0x3004
    LDI r15, 111           ; 'o'
    STORE r12, r15
    LDI r12, 0x3005
    LDI r15, 0             ; null terminator
    STORE r12, r15

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r15, 0             ; mode: store
    LDI r8, 0x3000        ; source addr
    LDI r5, 5             ; length
    CLIP_TEXT r15, r8, r5

    ; Draw label for step 1
    LDI r0, 2
    LDI r10, 16
    LDI r6, step1_label
    TEXT r0, r10, r6

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r15, 1             ; mode: paste
    LDI r8, 0x3100        ; dest addr
    LDI r5, 20            ; max len
    CLIP_TEXT r15, r8, r5
    LDI r0, 2
    LDI r10, 24
    LDI r6, 0x3100
    TEXT r0, r10, r6

    ; Visual indicator bar (green = text stored)
    LDI r3, 0x00FF00
    LDI r11, 2
    LDI r12, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r15, 0             ; mode: push
    LDI r8, 0             ; slot (unused for push)
    CLIP_HISTORY r15, r8

    ; Write "World" to RAM at 0x3000
    LDI r12, 0x3000
    LDI r15, 87            ; 'W'
    STORE r12, r15
    LDI r12, 0x3001
    LDI r15, 111           ; 'o'
    STORE r12, r15
    LDI r12, 0x3002
    LDI r15, 114           ; 'r'
    STORE r12, r15
    LDI r12, 0x3003
    LDI r15, 108           ; 'l'
    STORE r12, r15
    LDI r12, 0x3004
    LDI r15, 100           ; 'd'
    STORE r12, r15
    LDI r12, 0x3005
    LDI r15, 0
    STORE r12, r15

    ; Store "World" in text clipboard
    LDI r15, 0
    LDI r8, 0x3000
    LDI r5, 5
    CLIP_TEXT r15, r8, r5

    ; Draw label for step 2
    LDI r0, 2
    LDI r10, 48
    LDI r6, step2_label
    TEXT r0, r10, r6

    ; Paste "World"
    LDI r15, 1
    LDI r8, 0x3100
    LDI r5, 20
    CLIP_TEXT r15, r8, r5
    LDI r0, 2
    LDI r10, 56
    LDI r6, 0x3100
    TEXT r0, r10, r6

    ; Visual indicator bar (yellow = history + new text)
    LDI r3, 0xFFFF00
    LDI r11, 2
    LDI r12, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r15, 2             ; mode: restore
    LDI r8, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r15, r8

    ; Draw label for step 3
    LDI r0, 2
    LDI r10, 80
    LDI r6, step3_label
    TEXT r0, r10, r6

    ; Paste restored text
    LDI r15, 1
    LDI r8, 0x3100
    LDI r5, 20
    CLIP_TEXT r15, r8, r5
    LDI r0, 2
    LDI r10, 88
    LDI r6, 0x3100
    TEXT r0, r10, r6

    ; Visual indicator bar (cyan = restored)
    LDI r3, 0x00FFFF
    LDI r11, 2
    LDI r12, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r13, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r12, 0x3000
    LDI r15, 48            ; '0'
    ADD r15, r13
    STORE r12, r15
    LDI r12, 0x3001
    LDI r15, 0
    STORE r12, r15

    ; Store in text clipboard
    LDI r15, 0
    LDI r8, 0x3000
    LDI r5, 1
    CLIP_TEXT r15, r8, r5

    ; Push to history
    LDI r15, 0
    LDI r8, 0
    CLIP_HISTORY r15, r8

    ADDI r13, 1
    LDI r1, 10
    CMP r13, r1
    BLT r7, fill_loop

    ; Draw label for step 4
    LDI r0, 2
    LDI r10, 112
    LDI r6, step4_label
    TEXT r0, r10, r6

    ; Restore oldest surviving entry (should be "2")
    LDI r15, 2             ; restore
    LDI r8, 7             ; oldest slot
    CLIP_HISTORY r15, r8

    LDI r15, 1
    LDI r8, 0x3100
    LDI r5, 20
    CLIP_TEXT r15, r8, r5
    LDI r0, 2
    LDI r10, 120
    LDI r6, 0x3100
    TEXT r0, r10, r6

    ; Visual indicator bar (magenta = ring buffer)
    LDI r3, 0xFF00FF
    LDI r11, 2
    LDI r12, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r15, 3             ; mode: clear
    LDI r8, 0
    CLIP_HISTORY r15, r8

    ; Draw label for step 5
    LDI r0, 2
    LDI r10, 144
    LDI r6, step5_label
    TEXT r0, r10, r6

    ; Visual indicator bar (white = cleared)
    LDI r3, 0xFFFFFF
    LDI r11, 2
    LDI r12, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r3 = color, r11 = x, r12 = y
draw_bar:
    LDI r4, 40           ; width
bar_loop:
    PSET r11, r12, r3
    ADDI r11, 1
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
