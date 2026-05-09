; DESCRIPTION: Renders a yellow line between points (302, 63) and (114, 86).
; PLAN: r0=302(x1), r1=63(y1), r2=114(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 63
LDI r2, 114
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
