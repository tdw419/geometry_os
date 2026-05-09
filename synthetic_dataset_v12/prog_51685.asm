; DESCRIPTION: Draws a blue line from (45, 134) to (343, 116).
; PLAN: r0=45(x1), r1=134(y1), r2=343(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 134
LDI r2, 343
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
