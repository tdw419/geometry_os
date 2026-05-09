; DESCRIPTION: Places a blue line segment connecting (511, 131) to (504, 176).
; PLAN: r0=511(x1), r1=131(y1), r2=504(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 131
LDI r2, 504
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
