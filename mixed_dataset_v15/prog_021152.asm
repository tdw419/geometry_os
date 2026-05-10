; DESCRIPTION: Places a blue line segment connecting (402, 247) to (299, 66).
; PLAN: r0=402(x1), r1=247(y1), r2=299(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 247
LDI r2, 299
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
