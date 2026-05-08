; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
    LDI r12, 2
    LDI r7, 0
    LDI r9, title
    TEXT r12, r7, r9

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r6, 0x3000
    LDI r0, 72            ; 'H'
    STORE r6, r0
    LDI r6, 0x3001
    LDI r0, 101           ; 'e'
    STORE r6, r0
    LDI r6, 0x3002
    LDI r0, 108           ; 'l'
    STORE r6, r0
    LDI r6, 0x3003
    LDI r0, 108           ; 'l'
    STORE r6, r0
    LDI r6, 0x3004
    LDI r0, 111           ; 'o'
    STORE r6, r0
    LDI r6, 0x3005
    LDI r0, 0             ; null terminator
    STORE r6, r0

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r0, 0             ; mode: store
    LDI r11, 0x3000        ; source addr
    LDI r3, 5             ; length
    CLIP_TEXT r0, r11, r3

    ; Draw label for step 1
    LDI r12, 2
    LDI r7, 16
    LDI r9, step1_label
    TEXT r12, r7, r9

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r0, 1             ; mode: paste
    LDI r11, 0x3100        ; dest addr
    LDI r3, 20            ; max len
    CLIP_TEXT r0, r11, r3
    LDI r12, 2
    LDI r7, 24
    LDI r9, 0x3100
    TEXT r12, r7, r9

    ; Visual indicator bar (green = text stored)
    LDI r4, 0x00FF00
    LDI r15, 2
    LDI r6, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r0, 0             ; mode: push
    LDI r11, 0             ; slot (unused for push)
    CLIP_HISTORY r0, r11

    ; Write "World" to RAM at 0x3000
    LDI r6, 0x3000
    LDI r0, 87            ; 'W'
    STORE r6, r0
    LDI r6, 0x3001
    LDI r0, 111           ; 'o'
    STORE r6, r0
    LDI r6, 0x3002
    LDI r0, 114           ; 'r'
    STORE r6, r0
    LDI r6, 0x3003
    LDI r0, 108           ; 'l'
    STORE r6, r0
    LDI r6, 0x3004
    LDI r0, 100           ; 'd'
    STORE r6, r0
    LDI r6, 0x3005
    LDI r0, 0
    STORE r6, r0

    ; Store "World" in text clipboard
    LDI r0, 0
    LDI r11, 0x3000
    LDI r3, 5
    CLIP_TEXT r0, r11, r3

    ; Draw label for step 2
    LDI r12, 2
    LDI r7, 48
    LDI r9, step2_label
    TEXT r12, r7, r9

    ; Paste "World"
    LDI r0, 1
    LDI r11, 0x3100
    LDI r3, 20
    CLIP_TEXT r0, r11, r3
    LDI r12, 2
    LDI r7, 56
    LDI r9, 0x3100
    TEXT r12, r7, r9

    ; Visual indicator bar (yellow = history + new text)
    LDI r4, 0xFFFF00
    LDI r15, 2
    LDI r6, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r0, 2             ; mode: restore
    LDI r11, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r0, r11

    ; Draw label for step 3
    LDI r12, 2
    LDI r7, 80
    LDI r9, step3_label
    TEXT r12, r7, r9

    ; Paste restored text
    LDI r0, 1
    LDI r11, 0x3100
    LDI r3, 20
    CLIP_TEXT r0, r11, r3
    LDI r12, 2
    LDI r7, 88
    LDI r9, 0x3100
    TEXT r12, r7, r9

    ; Visual indicator bar (cyan = restored)
    LDI r4, 0x00FFFF
    LDI r15, 2
    LDI r6, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r10, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r6, 0x3000
    LDI r0, 48            ; '0'
    ADD r0, r10
    STORE r6, r0
    LDI r6, 0x3001
    LDI r0, 0
    STORE r6, r0

    ; Store in text clipboard
    LDI r0, 0
    LDI r11, 0x3000
    LDI r3, 1
    CLIP_TEXT r0, r11, r3

    ; Push to history
    LDI r0, 0
    LDI r11, 0
    CLIP_HISTORY r0, r11

    ADDI r10, 1
    LDI r13, 10
    CMP r10, r13
    BLT r8, fill_loop

    ; Draw label for step 4
    LDI r12, 2
    LDI r7, 112
    LDI r9, step4_label
    TEXT r12, r7, r9

    ; Restore oldest surviving entry (should be "2")
    LDI r0, 2             ; restore
    LDI r11, 7             ; oldest slot
    CLIP_HISTORY r0, r11

    LDI r0, 1
    LDI r11, 0x3100
    LDI r3, 20
    CLIP_TEXT r0, r11, r3
    LDI r12, 2
    LDI r7, 120
    LDI r9, 0x3100
    TEXT r12, r7, r9

    ; Visual indicator bar (magenta = ring buffer)
    LDI r4, 0xFF00FF
    LDI r15, 2
    LDI r6, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r0, 3             ; mode: clear
    LDI r11, 0
    CLIP_HISTORY r0, r11

    ; Draw label for step 5
    LDI r12, 2
    LDI r7, 144
    LDI r9, step5_label
    TEXT r12, r7, r9

    ; Visual indicator bar (white = cleared)
    LDI r4, 0xFFFFFF
    LDI r15, 2
    LDI r6, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r4 = color, r15 = x, r6 = y
draw_bar:
    LDI r1, 40           ; width
bar_loop:
    PSET r15, r6, r4
    ADDI r15, 1
    SUBI r1, 1
    JNZ r1, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
