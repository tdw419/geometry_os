; DESCRIPTION: Renders a magenta line segment connecting (108, 99) to (163, 59).
; PLAN: r0=108(x1), r1=99(y1), r2=163(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 99
LDI r2, 163
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
