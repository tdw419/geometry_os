; DESCRIPTION: Places a green line segment connecting (154, 181) to (200, 69).
; PLAN: r0=154(x1), r1=181(y1), r2=200(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 181
LDI r2, 200
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
