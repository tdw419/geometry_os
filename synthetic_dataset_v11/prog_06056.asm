; DESCRIPTION: Draws a yellow line from (130, 78) to (29, 33).
; PLAN: r0=130(x1), r1=78(y1), r2=29(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 78
LDI r2, 29
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
