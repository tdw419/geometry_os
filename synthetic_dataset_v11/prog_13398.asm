; DESCRIPTION: Renders a purple line between points (252, 42) and (96, 218).
; PLAN: r0=252(x1), r1=42(y1), r2=96(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 42
LDI r2, 96
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
