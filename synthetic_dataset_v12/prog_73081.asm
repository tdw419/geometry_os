; DESCRIPTION: Renders a purple line between points (187, 184) and (498, 176).
; PLAN: r0=187(x1), r1=184(y1), r2=498(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 184
LDI r2, 498
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
