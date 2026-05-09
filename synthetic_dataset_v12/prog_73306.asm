; DESCRIPTION: Renders a blue line between points (100, 175) and (399, 39).
; PLAN: r0=100(x1), r1=175(y1), r2=399(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 175
LDI r2, 399
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
