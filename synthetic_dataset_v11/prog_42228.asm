; DESCRIPTION: Renders a blue line between points (12, 158) and (239, 92).
; PLAN: r0=12(x1), r1=158(y1), r2=239(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 158
LDI r2, 239
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
