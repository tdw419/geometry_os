; DESCRIPTION: Renders a purple line between points (203, 64) and (184, 30).
; PLAN: r0=203(x1), r1=64(y1), r2=184(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 64
LDI r2, 184
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
