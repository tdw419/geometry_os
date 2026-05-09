; DESCRIPTION: Renders a purple line between points (63, 76) and (371, 89).
; PLAN: r0=63(x1), r1=76(y1), r2=371(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 76
LDI r2, 371
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
