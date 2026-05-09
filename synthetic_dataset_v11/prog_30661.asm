; DESCRIPTION: Renders a blue line between points (44, 90) and (15, 102).
; PLAN: r0=44(x1), r1=90(y1), r2=15(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 90
LDI r2, 15
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
