; DESCRIPTION: Renders a black line between points (25, 145) and (212, 165).
; PLAN: r0=25(x1), r1=145(y1), r2=212(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 145
LDI r2, 212
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
