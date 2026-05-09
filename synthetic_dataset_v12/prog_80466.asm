; DESCRIPTION: Draws a yellow line from (119, 210) to (88, 205).
; PLAN: r0=119(x1), r1=210(y1), r2=88(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 210
LDI r2, 88
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
