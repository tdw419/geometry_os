; DESCRIPTION: Renders a purple line between points (421, 96) and (272, 163).
; PLAN: r0=421(x1), r1=96(y1), r2=272(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 96
LDI r2, 272
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
