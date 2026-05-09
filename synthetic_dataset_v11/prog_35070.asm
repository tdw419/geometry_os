; DESCRIPTION: Renders a blue line between points (99, 166) and (234, 77).
; PLAN: r0=99(x1), r1=166(y1), r2=234(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 166
LDI r2, 234
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
