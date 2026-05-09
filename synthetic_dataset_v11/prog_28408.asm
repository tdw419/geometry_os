; DESCRIPTION: Renders a magenta line between points (45, 15) and (53, 175).
; PLAN: r0=45(x1), r1=15(y1), r2=53(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 15
LDI r2, 53
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
