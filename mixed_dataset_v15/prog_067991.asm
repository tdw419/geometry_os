; DESCRIPTION: Draws a yellow line from (7, 20) to (34, 136).
; PLAN: r0=7(x1), r1=20(y1), r2=34(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 20
LDI r2, 34
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
