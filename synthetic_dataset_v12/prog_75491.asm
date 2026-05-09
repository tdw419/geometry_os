; DESCRIPTION: Places a blue line segment connecting (110, 56) to (206, 61).
; PLAN: r0=110(x1), r1=56(y1), r2=206(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 56
LDI r2, 206
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
