; DESCRIPTION: Renders a magenta line between points (366, 185) and (53, 178).
; PLAN: r0=366(x1), r1=185(y1), r2=53(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 185
LDI r2, 53
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
