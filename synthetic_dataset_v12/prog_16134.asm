; DESCRIPTION: Places a blue line segment connecting (340, 148) to (308, 23).
; PLAN: r0=340(x1), r1=148(y1), r2=308(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 148
LDI r2, 308
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
