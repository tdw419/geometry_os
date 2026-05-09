; DESCRIPTION: Renders a purple line between points (69, 132) and (299, 157).
; PLAN: r0=69(x1), r1=132(y1), r2=299(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 132
LDI r2, 299
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
