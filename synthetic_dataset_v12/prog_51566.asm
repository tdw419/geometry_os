; DESCRIPTION: Renders a yellow line between points (457, 156) and (228, 176).
; PLAN: r0=457(x1), r1=156(y1), r2=228(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 156
LDI r2, 228
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
