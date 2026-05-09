; DESCRIPTION: Renders a blue line between points (40, 3) and (64, 76).
; PLAN: r0=40(x1), r1=3(y1), r2=64(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 3
LDI r2, 64
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
