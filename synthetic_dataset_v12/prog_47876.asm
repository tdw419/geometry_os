; DESCRIPTION: Renders a magenta line between points (227, 66) and (292, 109).
; PLAN: r0=227(x1), r1=66(y1), r2=292(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 66
LDI r2, 292
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
