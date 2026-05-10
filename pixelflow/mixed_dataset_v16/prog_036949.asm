; DESCRIPTION: Renders a yellow line between points (472, 69) and (105, 106).
; PLAN: r0=472(x1), r1=69(y1), r2=105(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 69
LDI r2, 105
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
