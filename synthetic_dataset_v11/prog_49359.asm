; DESCRIPTION: Renders a blue line between points (12, 46) and (8, 22).
; PLAN: r0=12(x1), r1=46(y1), r2=8(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 46
LDI r2, 8
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
