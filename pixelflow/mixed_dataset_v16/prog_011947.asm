; DESCRIPTION: Renders a magenta line segment connecting (38, 141) to (372, 63).
; PLAN: r0=38(x1), r1=141(y1), r2=372(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 141
LDI r2, 372
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
