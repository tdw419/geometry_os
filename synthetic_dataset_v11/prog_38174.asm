; DESCRIPTION: Renders a yellow line between points (192, 156) and (249, 127).
; PLAN: r0=192(x1), r1=156(y1), r2=249(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 156
LDI r2, 249
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
