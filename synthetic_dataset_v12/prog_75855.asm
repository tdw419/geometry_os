; DESCRIPTION: Draws a purple line from (29, 244) to (269, 240).
; PLAN: r0=29(x1), r1=244(y1), r2=269(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 244
LDI r2, 269
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
