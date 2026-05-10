; DESCRIPTION: Renders a blue line between points (217, 40) and (92, 145).
; PLAN: r0=217(x1), r1=40(y1), r2=92(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 40
LDI r2, 92
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
