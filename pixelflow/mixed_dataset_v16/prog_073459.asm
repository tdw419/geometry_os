; DESCRIPTION: Renders a purple line between points (193, 138) and (379, 176).
; PLAN: r0=193(x1), r1=138(y1), r2=379(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 138
LDI r2, 379
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
