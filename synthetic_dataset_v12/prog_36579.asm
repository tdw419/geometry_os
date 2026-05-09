; DESCRIPTION: Renders a blue line between points (283, 122) and (6, 153).
; PLAN: r0=283(x1), r1=122(y1), r2=6(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 122
LDI r2, 6
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
