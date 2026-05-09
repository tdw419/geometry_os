; DESCRIPTION: Renders a blue line between points (0, 10) and (194, 16).
; PLAN: r0=0(x1), r1=10(y1), r2=194(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 10
LDI r2, 194
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
