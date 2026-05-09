; DESCRIPTION: Places a magenta line segment connecting (152, 130) to (212, 109).
; PLAN: r0=152(x1), r1=130(y1), r2=212(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 130
LDI r2, 212
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
