; DESCRIPTION: Renders a blue line between points (165, 252) and (416, 92).
; PLAN: r0=165(x1), r1=252(y1), r2=416(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 252
LDI r2, 416
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
