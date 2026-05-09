; DESCRIPTION: Renders a blue line between points (330, 217) and (212, 165).
; PLAN: r0=330(x1), r1=217(y1), r2=212(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 217
LDI r2, 212
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
