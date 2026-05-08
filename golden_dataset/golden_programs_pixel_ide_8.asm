; DESCRIPTION: Render a colored rectangle at the screen.

; pixel_ide.asm -- Windowed IDE Demo (Phase 70)
;
; Demonstrates a simple pixel IDE with three windowed panes:
; 1. Editor pane (top-left): Shows source code text
; 2. Build pane (top-right): Shows assembly status
; 3. Output pane (bottom): Shows program execution result
;
; The IDE writes a simple program to the canvas, assembles it,
; and shows the result in the output window.
; Uses WINSYS to create three windows, then draws into them.

; ---- Constants ----
LDI r20, 0x9000       ; title string storage
LDI r2, 1
LDI r3, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r9, 0x9000
LDI r13, 69; STORE r9, r13; ADD r9, r2
LDI r13, 100; STORE r9, r13; ADD r9, r2
LDI r13, 105; STORE r9, r13; ADD r9, r2
LDI r13, 116; STORE r9, r13; ADD r9, r2
LDI r13, 111; STORE r9, r13; ADD r9, r2
LDI r13, 114; STORE r9, r13; ADD r9, r2
LDI r13, 0; STORE r9, r13

; "Build" at 0x9010
LDI r9, 0x9010
LDI r13, 66; STORE r9, r13; ADD r9, r2
LDI r13, 117; STORE r9, r13; ADD r9, r2
LDI r13, 105; STORE r9, r13; ADD r9, r2
LDI r13, 108; STORE r9, r13; ADD r9, r2
LDI r13, 100; STORE r9, r13; ADD r9, r2
LDI r13, 0; STORE r9, r13

; "Output" at 0x9020
LDI r9, 0x9020
LDI r13, 79; STORE r9, r13; ADD r9, r2
LDI r13, 117; STORE r9, r13; ADD r9, r2
LDI r13, 116; STORE r9, r13; ADD r9, r2
LDI r13, 112; STORE r9, r13; ADD r9, r2
LDI r13, 117; STORE r9, r13; ADD r9, r2
LDI r13, 116; STORE r9, r13; ADD r9, r2
LDI r13, 0; STORE r9, r13

; ---- Write source code text to RAM for display ----
; "LDI r9, 42" at 0x9030
LDI r9, 0x9030
LDI r13, 76; STORE r9, r13; ADD r9, r2
LDI r13, 68; STORE r9, r13; ADD r9, r2
LDI r13, 73; STORE r9, r13; ADD r9, r2
LDI r13, 32; STORE r9, r13; ADD r9, r2
LDI r13, 114; STORE r9, r13; ADD r9, r2
LDI r13, 49; STORE r9, r13; ADD r9, r2
LDI r13, 44; STORE r9, r13; ADD r9, r2
LDI r13, 32; STORE r9, r13; ADD r9, r2
LDI r13, 52; STORE r9, r13; ADD r9, r2
LDI r13, 50; STORE r9, r13; ADD r9, r2
LDI r13, 10; STORE r9, r13; ADD r9, r2
LDI r13, 72; STORE r9, r13; ADD r9, r2
LDI r13, 65; STORE r9, r13; ADD r9, r2
LDI r13, 76; STORE r9, r13; ADD r9, r2
LDI r13, 84; STORE r9, r13; ADD r9, r2
LDI r13, 0; STORE r9, r13

; "OK: 3 words" at 0x9050
LDI r9, 0x9050
LDI r13, 79; STORE r9, r13; ADD r9, r2
LDI r13, 75; STORE r9, r13; ADD r9, r2
LDI r13, 58; STORE r9, r13; ADD r9, r2
LDI r13, 32; STORE r9, r13; ADD r9, r2
LDI r13, 51; STORE r9, r13; ADD r9, r2
LDI r13, 32; STORE r9, r13; ADD r9, r2
LDI r13, 119; STORE r9, r13; ADD r9, r2
LDI r13, 111; STORE r9, r13; ADD r9, r2
LDI r13, 114; STORE r9, r13; ADD r9, r2
LDI r13, 100; STORE r9, r13; ADD r9, r2
LDI r13, 115; STORE r9, r13; ADD r9, r2
LDI r13, 0; STORE r9, r13

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r9, 8
LDI r13, 8
LDI r8, 118
LDI r11, 100
LDI r7, 0x9000
LDI r14, 0
WINSYS r14
; r0 = window_id for editor (should be 1)

; Save editor window id
MOV r1, r0

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r9, 130
LDI r13, 8
LDI r8, 118
LDI r11, 100
LDI r7, 0x9010
LDI r14, 0
WINSYS r14
MOV r10, r0

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r9, 8
LDI r13, 116
LDI r8, 240
LDI r11, 132
LDI r7, 0x9020
LDI r14, 0
WINSYS r14
MOV r12, r0

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r5, 0x000022
LDI r15, 0

; Draw source code text into editor window
; Row 1: "LDI r9, 42" -- draw as green pixels
LDI r6, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r15, 76
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 68
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 73
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 32
WPIXEL r1, r16, r17, r15
ADD r16, r2
LDI r15, 114
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 49
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 44
WPIXEL r1, r16, r17, r15
ADD r16, r2
LDI r15, 32
WPIXEL r1, r16, r17, r15
ADD r16, r2
LDI r15, 52
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 50
WPIXEL r1, r16, r17, r6

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r15, 72
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 65
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 76
WPIXEL r1, r16, r17, r6
ADD r16, r2
LDI r15, 84
WPIXEL r1, r16, r17, r6

; ---- Draw build window content ----
; Green "OK" text
LDI r6, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r15, 79
WPIXEL r10, r16, r17, r6
ADD r16, r2
LDI r15, 75
WPIXEL r10, r16, r17, r6

; "3 words" in yellow below
LDI r6, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r15, 51
WPIXEL r10, r16, r17, r6
ADD r16, r2
LDI r15, 32
WPIXEL r10, r16, r17, r15
ADD r16, r2
LDI r15, 119
WPIXEL r10, r16, r17, r6
ADD r16, r2
LDI r15, 111
WPIXEL r10, r16, r17, r6
ADD r16, r2
LDI r15, 114
WPIXEL r10, r16, r17, r6
ADD r16, r2
LDI r15, 100
WPIXEL r10, r16, r17, r6
ADD r16, r2
LDI r15, 115
WPIXEL r10, r16, r17, r6

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r6, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r0, output_done
  WPIXEL r12, r16, r17, r6
  ADD r16, r2
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r6, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r0, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r0, output_gdone
  WPIXEL r12, r16, r17, r6
  ADD r16, r2
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r9, 42\nHALT\n" to 0x0800
LDI r9, 0x0800

LDI r13, 76
CALL wr
LDI r13, 68
CALL wr
LDI r13, 73
CALL wr
LDI r13, 32
CALL wr
LDI r13, 114
CALL wr
LDI r13, 49
CALL wr
LDI r13, 44
CALL wr
LDI r13, 32
CALL wr
LDI r13, 52
CALL wr
LDI r13, 50
CALL wr
LDI r13, 10
CALL wr
LDI r13, 72
CALL wr
LDI r13, 65
CALL wr
LDI r13, 76
CALL wr
LDI r13, 84
CALL wr
LDI r13, 10
CALL wr
LDI r13, 0
CALL wr

; Assemble it
LDI r7, 0x0800
LDI r14, 0x1000
ASM r7, r14

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r9, r13
    ADD r9, r2
    RET
