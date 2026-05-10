; DESCRIPTION: Renders a yellow line between points (495, 100) and (167, 100).
; PLAN: r0=495(x1), r1=100(y1), r2=167(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 100
LDI r2, 167
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
