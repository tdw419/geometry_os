; DESCRIPTION: Renders a magenta line between points (49, 103) and (153, 122).
; PLAN: r0=49(x1), r1=103(y1), r2=153(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 103
LDI r2, 153
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
