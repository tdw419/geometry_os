; DESCRIPTION: Renders a blue line between points (511, 108) and (64, 78).
; PLAN: r0=511(x1), r1=108(y1), r2=64(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 108
LDI r2, 64
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
