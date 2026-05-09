; DESCRIPTION: Renders a magenta line between points (498, 236) and (462, 84).
; PLAN: r0=498(x1), r1=236(y1), r2=462(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 236
LDI r2, 462
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
