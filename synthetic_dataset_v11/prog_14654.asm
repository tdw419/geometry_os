; DESCRIPTION: Renders a magenta line between points (162, 176) and (49, 109).
; PLAN: r0=162(x1), r1=176(y1), r2=49(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 176
LDI r2, 49
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
