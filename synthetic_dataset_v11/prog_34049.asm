; DESCRIPTION: Renders a magenta line between points (236, 91) and (114, 11).
; PLAN: r0=236(x1), r1=91(y1), r2=114(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 91
LDI r2, 114
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
