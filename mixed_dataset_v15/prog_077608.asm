; DESCRIPTION: Renders a yellow line between points (66, 63) and (413, 147).
; PLAN: r0=66(x1), r1=63(y1), r2=413(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 63
LDI r2, 413
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
