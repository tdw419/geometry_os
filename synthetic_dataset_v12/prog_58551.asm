; DESCRIPTION: Places a blue line segment connecting (35, 245) to (77, 33).
; PLAN: r0=35(x1), r1=245(y1), r2=77(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 245
LDI r2, 77
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
