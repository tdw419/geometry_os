; DESCRIPTION: Renders a yellow line between points (63, 86) and (3, 248).
; PLAN: r0=63(x1), r1=86(y1), r2=3(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 86
LDI r2, 3
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
