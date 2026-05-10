; DESCRIPTION: Places a magenta line segment connecting (212, 148) to (212, 14).
; PLAN: r0=212(x1), r1=148(y1), r2=212(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 148
LDI r2, 212
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
