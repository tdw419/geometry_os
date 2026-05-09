; DESCRIPTION: Renders a magenta line between points (457, 100) and (187, 96).
; PLAN: r0=457(x1), r1=100(y1), r2=187(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 100
LDI r2, 187
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
