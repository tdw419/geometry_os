; DESCRIPTION: Renders a magenta line between points (435, 58) and (498, 79).
; PLAN: r0=435(x1), r1=58(y1), r2=498(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 58
LDI r2, 498
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
