; DESCRIPTION: Renders a yellow line between points (136, 21) and (25, 68).
; PLAN: r0=136(x1), r1=21(y1), r2=25(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 21
LDI r2, 25
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
