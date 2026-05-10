; DESCRIPTION: Places a blue line segment connecting (329, 238) to (511, 89).
; PLAN: r0=329(x1), r1=238(y1), r2=511(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 238
LDI r2, 511
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
