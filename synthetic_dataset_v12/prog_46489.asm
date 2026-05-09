; DESCRIPTION: Renders a magenta line between points (495, 100) and (491, 82).
; PLAN: r0=495(x1), r1=100(y1), r2=491(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 100
LDI r2, 491
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
