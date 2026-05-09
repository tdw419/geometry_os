; DESCRIPTION: Renders a purple line between points (30, 128) and (50, 184).
; PLAN: r0=30(x1), r1=128(y1), r2=50(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 128
LDI r2, 50
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
