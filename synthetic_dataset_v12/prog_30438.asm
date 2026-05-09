; DESCRIPTION: Places a blue line segment connecting (234, 4) to (23, 173).
; PLAN: r0=234(x1), r1=4(y1), r2=23(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 4
LDI r2, 23
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
