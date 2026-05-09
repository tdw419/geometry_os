; DESCRIPTION: Renders a magenta line between points (157, 114) and (244, 160).
; PLAN: r0=157(x1), r1=114(y1), r2=244(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 114
LDI r2, 244
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
