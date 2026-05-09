; DESCRIPTION: Renders a magenta line between points (253, 2) and (100, 25).
; PLAN: r0=253(x1), r1=2(y1), r2=100(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 2
LDI r2, 100
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
