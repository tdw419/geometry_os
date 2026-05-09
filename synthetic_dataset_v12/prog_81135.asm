; DESCRIPTION: Draws a yellow line from (371, 227) to (240, 40).
; PLAN: r0=371(x1), r1=227(y1), r2=240(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 227
LDI r2, 240
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
