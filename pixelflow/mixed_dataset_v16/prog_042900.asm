; DESCRIPTION: Draws a purple line from (371, 175) to (454, 32).
; PLAN: r0=371(x1), r1=175(y1), r2=454(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 175
LDI r2, 454
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
