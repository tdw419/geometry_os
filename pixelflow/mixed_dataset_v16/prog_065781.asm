; DESCRIPTION: Renders a magenta line between points (495, 53) and (136, 120).
; PLAN: r0=495(x1), r1=53(y1), r2=136(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 53
LDI r2, 136
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
