; DESCRIPTION : Draw s a re d circle at the center of the screen ( 128 , 128 ) with radius 50 .

; circles . asm -- concentric circles with cycling colors

; center
LDI r4, 128
LDI r3, 128

; radius counter
LDI r6, 10

; loop count
LDI r11, 12

loop:
; color = radius * 20 ( cycles through hues roughly )
LDI r5, 20
MUL r5, r11

; shift into blue channel for variation
LDI r12, 0x0001000
MUL r12, r15
LDI r11, 0xFF
AND r15, r11
OR r15, r12

CIRCLE r4, r3, r15, r12

; radius += 20
LDI r4, 20
ADD r9, r4

; loop
LDI r4, 1
SUB r2, r4
JNZ r2, loop

HALT