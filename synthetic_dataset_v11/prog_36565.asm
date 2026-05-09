; DESCRIPTION: Renders a black line between points (156, 31) and (92, 92).
; PLAN: r0=156(x1), r1=31(y1), r2=92(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 31
LDI r2, 92
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
