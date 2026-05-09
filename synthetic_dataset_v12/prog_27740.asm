; DESCRIPTION: Renders a purple line between points (32, 251) and (490, 215).
; PLAN: r0=32(x1), r1=251(y1), r2=490(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 251
LDI r2, 490
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
