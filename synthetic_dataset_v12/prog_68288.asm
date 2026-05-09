; DESCRIPTION: Renders a purple line between points (325, 108) and (16, 220).
; PLAN: r0=325(x1), r1=108(y1), r2=16(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 108
LDI r2, 16
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
