; DESCRIPTION: Renders a green line between points (145, 156) and (107, 203).
; PLAN: r0=145(x1), r1=156(y1), r2=107(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 156
LDI r2, 107
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
