; DESCRIPTION: Renders a blue line between points (244, 125) and (30, 64).
; PLAN: r0=244(x1), r1=125(y1), r2=30(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 125
LDI r2, 30
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
