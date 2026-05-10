; DESCRIPTION: Renders a magenta line segment connecting (57, 149) to (130, 123).
; PLAN: r0=57(x1), r1=149(y1), r2=130(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 149
LDI r2, 130
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
