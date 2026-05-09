; DESCRIPTION: Places a magenta line segment connecting (100, 148) to (403, 181).
; PLAN: r0=100(x1), r1=148(y1), r2=403(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 148
LDI r2, 403
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
