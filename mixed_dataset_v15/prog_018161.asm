; DESCRIPTION: Renders a purple line between points (509, 156) and (75, 132).
; PLAN: r0=509(x1), r1=156(y1), r2=75(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 156
LDI r2, 75
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
