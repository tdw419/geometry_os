; DESCRIPTION: Renders a magenta line between points (13, 106) and (491, 120).
; PLAN: r0=13(x1), r1=106(y1), r2=491(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 106
LDI r2, 491
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
