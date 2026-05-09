; DESCRIPTION: Renders a blue line between points (318, 122) and (154, 92).
; PLAN: r0=318(x1), r1=122(y1), r2=154(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 122
LDI r2, 154
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
