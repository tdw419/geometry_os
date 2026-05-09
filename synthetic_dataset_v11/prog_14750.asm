; DESCRIPTION: Renders a blue line between points (167, 118) and (20, 92).
; PLAN: r0=167(x1), r1=118(y1), r2=20(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 118
LDI r2, 20
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
