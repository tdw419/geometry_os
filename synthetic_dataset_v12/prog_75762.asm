; DESCRIPTION: Renders a yellow line between points (265, 167) and (91, 216).
; PLAN: r0=265(x1), r1=167(y1), r2=91(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 167
LDI r2, 91
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
