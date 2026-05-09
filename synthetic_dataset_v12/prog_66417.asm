; DESCRIPTION: Renders a yellow line between points (184, 145) and (455, 22).
; PLAN: r0=184(x1), r1=145(y1), r2=455(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 145
LDI r2, 455
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
