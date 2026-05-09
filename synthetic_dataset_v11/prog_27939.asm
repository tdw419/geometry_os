; DESCRIPTION: Renders a purple line between points (241, 96) and (109, 166).
; PLAN: r0=241(x1), r1=96(y1), r2=109(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 96
LDI r2, 109
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
