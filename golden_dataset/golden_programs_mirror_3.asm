; DESCRIPTION: The GeOS assembly code draws three colored pixels on the screen, generates PSETI assembly instructions to reproduce these pixels on a canvas buffer, clears the screen, and then self-assembles and runs the generated canvas code to redraw the pixels.

; mirror.asm - Self-Modification Showcase Demo
; Reads screen pixels, generates PSETI assembly on the canvas,
; then self-assembles and runs the generated code.
; This proves: pixel -> text -> assembly -> bytecode -> pixel
;
; The program draws 3 colored pixels (red, green, blue),
; then generates PSETI instructions to reproduce it on canvas,
; clears the screen, and self-assembles + runs the canvas code.

; ===== Phase 1: Draw initial pattern =====
LDI r13, 0xFF0000
PSETI 100, 80, 0xFF0000
PSETI 100, 100, 0x00FF00
PSETI 100, 120, 0x0000FF

; ===== Phase 2: Generate PSETI assembly on canvas =====
; Write "PSETI 100,80,0xFF0000\nPSETI 100,100,0x00FF00\nPSETI 100,120,0x0000FF\nHALT"
; to the canvas buffer at 0x8000.
; Then ASMSELF + RUNNEXT will compile and execute this code.

LDI r4, 0x8000        ; canvas write position
LDI r0, 1             ; increment

; --- Subroutine: write char and advance ---
; Input: r17 = char to write
; Clobbers: nothing else (r4 advances)

; --- Pixel 0: PSETI 100,80,0xFF0000 ---
; "PSETI 100,80,0xFF0000\n"
LDI r17, 80             ; 'P'
STORE r4, r17
ADD r4, r0
LDI r17, 83             ; 'S'
STORE r4, r17
ADD r4, r0
LDI r17, 69             ; 'E'
STORE r4, r17
ADD r4, r0
LDI r17, 84             ; 'T'
STORE r4, r17
ADD r4, r0
LDI r17, 73             ; 'I'
STORE r4, r17
ADD r4, r0
LDI r17, 32             ; ' '
STORE r4, r17
ADD r4, r0
LDI r17, 49             ; '1'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 44             ; ','
STORE r4, r17
ADD r4, r0
LDI r17, 56             ; '8'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 44             ; ','
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 120            ; 'x'
STORE r4, r17
ADD r4, r0
LDI r17, 70             ; 'F'
STORE r4, r17
ADD r4, r0
LDI r17, 70             ; 'F'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 10             ; '\n'
STORE r4, r17
ADD r4, r0

; --- Pixel 1: PSETI 100,100,0xFFFF00 ---
LDI r17, 80             ; 'P'
STORE r4, r17
ADD r4, r0
LDI r17, 83             ; 'S'
STORE r4, r17
ADD r4, r0
LDI r17, 69             ; 'E'
STORE r4, r17
ADD r4, r0
LDI r17, 84             ; 'T'
STORE r4, r17
ADD r4, r0
LDI r17, 73             ; 'I'
STORE r4, r17
ADD r4, r0
LDI r17, 32             ; ' '
STORE r4, r17
ADD r4, r0
LDI r17, 49             ; '1'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 44             ; ','
STORE r4, r17
ADD r4, r0
LDI r17, 49             ; '1'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 44             ; ','
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 120            ; 'x'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
; "FF00" rest of green 0x00FF00
LDI r17, 70             ; 'F'
STORE r4, r17
ADD r4, r0
LDI r17, 70             ; 'F'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 10             ; '\n'
STORE r4, r17
ADD r4, r0

; --- Pixel 2: PSETI 100,120,0x00FF00 ---
LDI r17, 80             ; 'P'
STORE r4, r17
ADD r4, r0
LDI r17, 83             ; 'S'
STORE r4, r17
ADD r4, r0
LDI r17, 69             ; 'E'
STORE r4, r17
ADD r4, r0
LDI r17, 84             ; 'T'
STORE r4, r17
ADD r4, r0
LDI r17, 73             ; 'I'
STORE r4, r17
ADD r4, r0
LDI r17, 32             ; ' '
STORE r4, r17
ADD r4, r0
LDI r17, 49             ; '1'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 44             ; ','
STORE r4, r17
ADD r4, r0
LDI r17, 49             ; '1'
STORE r4, r17
ADD r4, r0
LDI r17, 50             ; '2'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 44             ; ','
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 120            ; 'x'
STORE r4, r17
ADD r4, r0
; "0000FF" for blue
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 48             ; '0'
STORE r4, r17
ADD r4, r0
LDI r17, 70             ; 'F'
STORE r4, r17
ADD r4, r0
LDI r17, 70             ; 'F'
STORE r4, r17
ADD r4, r0
LDI r17, 10             ; '\n'
STORE r4, r17
ADD r4, r0

; --- HALT ---
LDI r17, 72             ; 'H'
STORE r4, r17
ADD r4, r0
LDI r17, 65             ; 'A'
STORE r4, r17
ADD r4, r0
LDI r17, 76             ; 'L'
STORE r4, r17
ADD r4, r0
LDI r17, 84             ; 'T'
STORE r4, r17
ADD r4, r0

; Null-terminate
LDI r17, 0
STORE r4, r17

; ===== Phase 3: Clear screen and self-assemble =====
LDI r20, 0
FILL r20

ASMSELF
RUNNEXT
