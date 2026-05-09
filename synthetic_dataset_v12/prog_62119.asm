; DESCRIPTION: Renders a purple line between points (365, 211) and (66, 158).
; PLAN: r0=365(x1), r1=211(y1), r2=66(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 211
LDI r2, 66
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
