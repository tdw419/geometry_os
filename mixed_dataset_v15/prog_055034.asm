; DESCRIPTION: Renders a black line between points (106, 153) and (373, 47).
; PLAN: r0=106(x1), r1=153(y1), r2=373(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 153
LDI r2, 373
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
