; DESCRIPTION: Renders a magenta line between points (250, 248) and (244, 134).
; PLAN: r0=250(x1), r1=248(y1), r2=244(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 248
LDI r2, 244
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
