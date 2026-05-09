; DESCRIPTION: Renders a magenta line between points (123, 55) and (118, 179).
; PLAN: r0=123(x1), r1=55(y1), r2=118(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 55
LDI r2, 118
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
