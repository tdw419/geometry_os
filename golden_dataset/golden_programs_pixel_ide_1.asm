; DESCRIPTION: This GeOS assembly code sets up a simple pixel-based Integrated Development Environment (IDE) with three windowed panes: an editor pane for source code text, a build pane for assembly status, and an output pane for program execution results. It uses the WINSYS system calls to create and manage these windows, drawing titles and content into each using pixel manipulation instructions. The IDE also assembles and runs a simple program directly from RAM.

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
LDI r6, 1
LDI r10, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r12, 0x9000
LDI r3, 69; STORE r12, r3; ADD r12, r6
LDI r3, 100; STORE r12, r3; ADD r12, r6
LDI r3, 105; STORE r12, r3; ADD r12, r6
LDI r3, 116; STORE r12, r3; ADD r12, r6
LDI r3, 111; STORE r12, r3; ADD r12, r6
LDI r3, 114; STORE r12, r3; ADD r12, r6
LDI r3, 0; STORE r12, r3

; "Build" at 0x9010
LDI r12, 0x9010
LDI r3, 66; STORE r12, r3; ADD r12, r6
LDI r3, 117; STORE r12, r3; ADD r12, r6
LDI r3, 105; STORE r12, r3; ADD r12, r6
LDI r3, 108; STORE r12, r3; ADD r12, r6
LDI r3, 100; STORE r12, r3; ADD r12, r6
LDI r3, 0; STORE r12, r3

; "Output" at 0x9020
LDI r12, 0x9020
LDI r3, 79; STORE r12, r3; ADD r12, r6
LDI r3, 117; STORE r12, r3; ADD r12, r6
LDI r3, 116; STORE r12, r3; ADD r12, r6
LDI r3, 112; STORE r12, r3; ADD r12, r6
LDI r3, 117; STORE r12, r3; ADD r12, r6
LDI r3, 116; STORE r12, r3; ADD r12, r6
LDI r3, 0; STORE r12, r3

; ---- Write source code text to RAM for display ----
; "LDI r12, 42" at 0x9030
LDI r12, 0x9030
LDI r3, 76; STORE r12, r3; ADD r12, r6
LDI r3, 68; STORE r12, r3; ADD r12, r6
LDI r3, 73; STORE r12, r3; ADD r12, r6
LDI r3, 32; STORE r12, r3; ADD r12, r6
LDI r3, 114; STORE r12, r3; ADD r12, r6
LDI r3, 49; STORE r12, r3; ADD r12, r6
LDI r3, 44; STORE r12, r3; ADD r12, r6
LDI r3, 32; STORE r12, r3; ADD r12, r6
LDI r3, 52; STORE r12, r3; ADD r12, r6
LDI r3, 50; STORE r12, r3; ADD r12, r6
LDI r3, 10; STORE r12, r3; ADD r12, r6
LDI r3, 72; STORE r12, r3; ADD r12, r6
LDI r3, 65; STORE r12, r3; ADD r12, r6
LDI r3, 76; STORE r12, r3; ADD r12, r6
LDI r3, 84; STORE r12, r3; ADD r12, r6
LDI r3, 0; STORE r12, r3

; "OK: 3 words" at 0x9050
LDI r12, 0x9050
LDI r3, 79; STORE r12, r3; ADD r12, r6
LDI r3, 75; STORE r12, r3; ADD r12, r6
LDI r3, 58; STORE r12, r3; ADD r12, r6
LDI r3, 32; STORE r12, r3; ADD r12, r6
LDI r3, 51; STORE r12, r3; ADD r12, r6
LDI r3, 32; STORE r12, r3; ADD r12, r6
LDI r3, 119; STORE r12, r3; ADD r12, r6
LDI r3, 111; STORE r12, r3; ADD r12, r6
LDI r3, 114; STORE r12, r3; ADD r12, r6
LDI r3, 100; STORE r12, r3; ADD r12, r6
LDI r3, 115; STORE r12, r3; ADD r12, r6
LDI r3, 0; STORE r12, r3

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r12, 8
LDI r3, 8
LDI r8, 118
LDI r4, 100
LDI r11, 0x9000
LDI r9, 0
WINSYS r9
; r1 = window_id for editor (should be 1)

; Save editor window id
MOV r2, r1

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r12, 130
LDI r3, 8
LDI r8, 118
LDI r4, 100
LDI r11, 0x9010
LDI r9, 0
WINSYS r9
MOV r7, r1

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r12, 8
LDI r3, 116
LDI r8, 240
LDI r4, 132
LDI r11, 0x9020
LDI r9, 0
WINSYS r9
MOV r5, r1

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r14, 0x000022
LDI r15, 0

; Draw source code text into editor window
; Row 1: "LDI r12, 42" -- draw as green pixels
LDI r0, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r15, 76
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 68
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 73
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 32
WPIXEL r2, r16, r17, r15
ADD r16, r6
LDI r15, 114
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 49
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 44
WPIXEL r2, r16, r17, r15
ADD r16, r6
LDI r15, 32
WPIXEL r2, r16, r17, r15
ADD r16, r6
LDI r15, 52
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 50
WPIXEL r2, r16, r17, r0

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r15, 72
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 65
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 76
WPIXEL r2, r16, r17, r0
ADD r16, r6
LDI r15, 84
WPIXEL r2, r16, r17, r0

; ---- Draw build window content ----
; Green "OK" text
LDI r0, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r15, 79
WPIXEL r7, r16, r17, r0
ADD r16, r6
LDI r15, 75
WPIXEL r7, r16, r17, r0

; "3 words" in yellow below
LDI r0, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r15, 51
WPIXEL r7, r16, r17, r0
ADD r16, r6
LDI r15, 32
WPIXEL r7, r16, r17, r15
ADD r16, r6
LDI r15, 119
WPIXEL r7, r16, r17, r0
ADD r16, r6
LDI r15, 111
WPIXEL r7, r16, r17, r0
ADD r16, r6
LDI r15, 114
WPIXEL r7, r16, r17, r0
ADD r16, r6
LDI r15, 100
WPIXEL r7, r16, r17, r0
ADD r16, r6
LDI r15, 115
WPIXEL r7, r16, r17, r0

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r0, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r1, output_done
  WPIXEL r5, r16, r17, r0
  ADD r16, r6
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r0, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r1, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r1, output_gdone
  WPIXEL r5, r16, r17, r0
  ADD r16, r6
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r12, 42\nHALT\n" to 0x0800
LDI r12, 0x0800

LDI r3, 76
CALL wr
LDI r3, 68
CALL wr
LDI r3, 73
CALL wr
LDI r3, 32
CALL wr
LDI r3, 114
CALL wr
LDI r3, 49
CALL wr
LDI r3, 44
CALL wr
LDI r3, 32
CALL wr
LDI r3, 52
CALL wr
LDI r3, 50
CALL wr
LDI r3, 10
CALL wr
LDI r3, 72
CALL wr
LDI r3, 65
CALL wr
LDI r3, 76
CALL wr
LDI r3, 84
CALL wr
LDI r3, 10
CALL wr
LDI r3, 0
CALL wr

; Assemble it
LDI r11, 0x0800
LDI r9, 0x1000
ASM r11, r9

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r12, r3
    ADD r12, r6
    RET
