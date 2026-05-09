; DESCRIPTION: Renders a purple line between points (184, 8) and (173, 240).
; PLAN: r0=184(x1), r1=8(y1), r2=173(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 8
LDI r2, 173
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
