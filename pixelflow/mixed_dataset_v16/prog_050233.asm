; DESCRIPTION: Renders a purple line between points (318, 66) and (173, 166).
; PLAN: r0=318(x1), r1=66(y1), r2=173(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 66
LDI r2, 173
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
