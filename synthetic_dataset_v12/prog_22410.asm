; DESCRIPTION: Places a blue line segment connecting (36, 245) to (280, 189).
; PLAN: r0=36(x1), r1=245(y1), r2=280(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 245
LDI r2, 280
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
