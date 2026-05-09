; DESCRIPTION: Places a blue line segment connecting (173, 238) to (211, 72).
; PLAN: r0=173(x1), r1=238(y1), r2=211(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 238
LDI r2, 211
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
