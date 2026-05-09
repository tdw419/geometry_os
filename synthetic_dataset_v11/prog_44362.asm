; DESCRIPTION: Renders a black line between points (115, 87) and (92, 148).
; PLAN: r0=115(x1), r1=87(y1), r2=92(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 87
LDI r2, 92
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
