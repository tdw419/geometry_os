; DESCRIPTION: Renders a yellow line between points (36, 22) and (127, 114).
; PLAN: r0=36(x1), r1=22(y1), r2=127(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 22
LDI r2, 127
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
