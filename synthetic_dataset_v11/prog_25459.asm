; DESCRIPTION: Draws a purple line from (23, 175) to (165, 227).
; PLAN: r0=23(x1), r1=175(y1), r2=165(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 175
LDI r2, 165
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
