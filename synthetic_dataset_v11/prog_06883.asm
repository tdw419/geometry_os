; DESCRIPTION: Renders a black line between points (92, 145) and (154, 25).
; PLAN: r0=92(x1), r1=145(y1), r2=154(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 145
LDI r2, 154
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
