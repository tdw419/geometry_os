; DESCRIPTION: Renders a blue line between points (92, 10) and (205, 1).
; PLAN: r0=92(x1), r1=10(y1), r2=205(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 10
LDI r2, 205
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
