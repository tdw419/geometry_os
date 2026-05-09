; DESCRIPTION: Renders a purple line between points (265, 149) and (388, 6).
; PLAN: r0=265(x1), r1=149(y1), r2=388(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 149
LDI r2, 388
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
