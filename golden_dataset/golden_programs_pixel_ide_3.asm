; DESCRIPTION: Geometry OS program to draw a colored rectangle.

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
LDI r10, 1
LDI r11, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r14, 0x9000
LDI r5, 69; STORE r14, r5; ADD r14, r10
LDI r5, 100; STORE r14, r5; ADD r14, r10
LDI r5, 105; STORE r14, r5; ADD r14, r10
LDI r5, 116; STORE r14, r5; ADD r14, r10
LDI r5, 111; STORE r14, r5; ADD r14, r10
LDI r5, 114; STORE r14, r5; ADD r14, r10
LDI r5, 0; STORE r14, r5

; "Build" at 0x9010
LDI r14, 0x9010
LDI r5, 66; STORE r14, r5; ADD r14, r10
LDI r5, 117; STORE r14, r5; ADD r14, r10
LDI r5, 105; STORE r14, r5; ADD r14, r10
LDI r5, 108; STORE r14, r5; ADD r14, r10
LDI r5, 100; STORE r14, r5; ADD r14, r10
LDI r5, 0; STORE r14, r5

; "Output" at 0x9020
LDI r14, 0x9020
LDI r5, 79; STORE r14, r5; ADD r14, r10
LDI r5, 117; STORE r14, r5; ADD r14, r10
LDI r5, 116; STORE r14, r5; ADD r14, r10
LDI r5, 112; STORE r14, r5; ADD r14, r10
LDI r5, 117; STORE r14, r5; ADD r14, r10
LDI r5, 116; STORE r14, r5; ADD r14, r10
LDI r5, 0; STORE r14, r5

; ---- Write source code text to RAM for display ----
; "LDI r14, 42" at 0x9030
LDI r14, 0x9030
LDI r5, 76; STORE r14, r5; ADD r14, r10
LDI r5, 68; STORE r14, r5; ADD r14, r10
LDI r5, 73; STORE r14, r5; ADD r14, r10
LDI r5, 32; STORE r14, r5; ADD r14, r10
LDI r5, 114; STORE r14, r5; ADD r14, r10
LDI r5, 49; STORE r14, r5; ADD r14, r10
LDI r5, 44; STORE r14, r5; ADD r14, r10
LDI r5, 32; STORE r14, r5; ADD r14, r10
LDI r5, 52; STORE r14, r5; ADD r14, r10
LDI r5, 50; STORE r14, r5; ADD r14, r10
LDI r5, 10; STORE r14, r5; ADD r14, r10
LDI r5, 72; STORE r14, r5; ADD r14, r10
LDI r5, 65; STORE r14, r5; ADD r14, r10
LDI r5, 76; STORE r14, r5; ADD r14, r10
LDI r5, 84; STORE r14, r5; ADD r14, r10
LDI r5, 0; STORE r14, r5

; "OK: 3 words" at 0x9050
LDI r14, 0x9050
LDI r5, 79; STORE r14, r5; ADD r14, r10
LDI r5, 75; STORE r14, r5; ADD r14, r10
LDI r5, 58; STORE r14, r5; ADD r14, r10
LDI r5, 32; STORE r14, r5; ADD r14, r10
LDI r5, 51; STORE r14, r5; ADD r14, r10
LDI r5, 32; STORE r14, r5; ADD r14, r10
LDI r5, 119; STORE r14, r5; ADD r14, r10
LDI r5, 111; STORE r14, r5; ADD r14, r10
LDI r5, 114; STORE r14, r5; ADD r14, r10
LDI r5, 100; STORE r14, r5; ADD r14, r10
LDI r5, 115; STORE r14, r5; ADD r14, r10
LDI r5, 0; STORE r14, r5

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r14, 8
LDI r5, 8
LDI r4, 118
LDI r6, 100
LDI r13, 0x9000
LDI r7, 0
WINSYS r7
; r3 = window_id for editor (should be 1)

; Save editor window id
MOV r15, r3

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r14, 130
LDI r5, 8
LDI r4, 118
LDI r6, 100
LDI r13, 0x9010
LDI r7, 0
WINSYS r7
MOV r0, r3

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r14, 8
LDI r5, 116
LDI r4, 240
LDI r6, 132
LDI r13, 0x9020
LDI r7, 0
WINSYS r7
MOV r1, r3

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r9, 0x000022
LDI r8, 0

; Draw source code text into editor window
; Row 1: "LDI r14, 42" -- draw as green pixels
LDI r12, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r8, 76
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 68
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 73
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 32
WPIXEL r15, r16, r17, r8
ADD r16, r10
LDI r8, 114
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 49
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 44
WPIXEL r15, r16, r17, r8
ADD r16, r10
LDI r8, 32
WPIXEL r15, r16, r17, r8
ADD r16, r10
LDI r8, 52
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 50
WPIXEL r15, r16, r17, r12

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r8, 72
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 65
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 76
WPIXEL r15, r16, r17, r12
ADD r16, r10
LDI r8, 84
WPIXEL r15, r16, r17, r12

; ---- Draw build window content ----
; Green "OK" text
LDI r12, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r8, 79
WPIXEL r0, r16, r17, r12
ADD r16, r10
LDI r8, 75
WPIXEL r0, r16, r17, r12

; "3 words" in yellow below
LDI r12, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r8, 51
WPIXEL r0, r16, r17, r12
ADD r16, r10
LDI r8, 32
WPIXEL r0, r16, r17, r8
ADD r16, r10
LDI r8, 119
WPIXEL r0, r16, r17, r12
ADD r16, r10
LDI r8, 111
WPIXEL r0, r16, r17, r12
ADD r16, r10
LDI r8, 114
WPIXEL r0, r16, r17, r12
ADD r16, r10
LDI r8, 100
WPIXEL r0, r16, r17, r12
ADD r16, r10
LDI r8, 115
WPIXEL r0, r16, r17, r12

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r12, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r3, output_done
  WPIXEL r1, r16, r17, r12
  ADD r16, r10
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r12, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r3, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r3, output_gdone
  WPIXEL r1, r16, r17, r12
  ADD r16, r10
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r14, 42\nHALT\n" to 0x0800
LDI r14, 0x0800

LDI r5, 76
CALL wr
LDI r5, 68
CALL wr
LDI r5, 73
CALL wr
LDI r5, 32
CALL wr
LDI r5, 114
CALL wr
LDI r5, 49
CALL wr
LDI r5, 44
CALL wr
LDI r5, 32
CALL wr
LDI r5, 52
CALL wr
LDI r5, 50
CALL wr
LDI r5, 10
CALL wr
LDI r5, 72
CALL wr
LDI r5, 65
CALL wr
LDI r5, 76
CALL wr
LDI r5, 84
CALL wr
LDI r5, 10
CALL wr
LDI r5, 0
CALL wr

; Assemble it
LDI r13, 0x0800
LDI r7, 0x1000
ASM r13, r7

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r14, r5
    ADD r14, r10
    RET
