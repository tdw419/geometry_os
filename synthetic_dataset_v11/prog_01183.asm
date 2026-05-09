; DESCRIPTION: Renders a yellow line between points (15, 101) and (237, 226).
; PLAN: r0=15(x1), r1=101(y1), r2=237(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 101
LDI r2, 237
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
