; DESCRIPTION: Renders a blue line between points (76, 22) and (226, 86).
; PLAN: r0=76(x1), r1=22(y1), r2=226(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 22
LDI r2, 226
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
