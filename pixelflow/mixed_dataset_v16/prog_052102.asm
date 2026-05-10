; DESCRIPTION: Renders a yellow line between points (167, 244) and (229, 88).
; PLAN: r0=167(x1), r1=244(y1), r2=229(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 244
LDI r2, 229
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
