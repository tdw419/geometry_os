; DESCRIPTION: Renders a magenta line between points (81, 251) and (45, 92).
; PLAN: r0=81(x1), r1=251(y1), r2=45(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 251
LDI r2, 45
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
