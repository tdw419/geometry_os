; DESCRIPTION: Renders a purple line between points (32, 180) and (504, 206).
; PLAN: r0=32(x1), r1=180(y1), r2=504(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 180
LDI r2, 504
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
