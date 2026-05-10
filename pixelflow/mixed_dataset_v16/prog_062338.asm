; DESCRIPTION: Renders a magenta line between points (174, 76) and (227, 122).
; PLAN: r0=174(x1), r1=76(y1), r2=227(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 76
LDI r2, 227
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
