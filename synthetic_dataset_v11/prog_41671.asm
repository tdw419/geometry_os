; DESCRIPTION: Renders a red line between points (78, 144) and (45, 181).
; PLAN: r0=78(x1), r1=144(y1), r2=45(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 144
LDI r2, 45
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
