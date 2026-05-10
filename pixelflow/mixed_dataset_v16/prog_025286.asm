; DESCRIPTION: Renders a black line between points (8, 70) and (145, 109).
; PLAN: r0=8(x1), r1=70(y1), r2=145(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 70
LDI r2, 145
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
