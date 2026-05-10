; DESCRIPTION: Renders a blue line between points (194, 9) and (215, 22).
; PLAN: r0=194(x1), r1=9(y1), r2=215(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 9
LDI r2, 215
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
