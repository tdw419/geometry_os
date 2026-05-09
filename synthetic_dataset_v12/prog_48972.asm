; DESCRIPTION: Renders a magenta line between points (300, 240) and (500, 84).
; PLAN: r0=300(x1), r1=240(y1), r2=500(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 240
LDI r2, 500
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
