; DESCRIPTION: Places a magenta line segment connecting (244, 166) to (144, 92).
; PLAN: r0=244(x1), r1=166(y1), r2=144(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 166
LDI r2, 144
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
