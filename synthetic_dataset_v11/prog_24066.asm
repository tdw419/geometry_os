; DESCRIPTION: Places a blue line segment connecting (193, 122) to (184, 76).
; PLAN: r0=193(x1), r1=122(y1), r2=184(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 122
LDI r2, 184
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
