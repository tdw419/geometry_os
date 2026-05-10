; DESCRIPTION: Renders a magenta line segment connecting (24, 16) to (1, 67).
; PLAN: r0=24(x1), r1=16(y1), r2=1(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 16
LDI r2, 1
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
