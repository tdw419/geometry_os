; DESCRIPTION: Places a blue line segment connecting (247, 245) to (4, 12).
; PLAN: r0=247(x1), r1=245(y1), r2=4(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 245
LDI r2, 4
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
