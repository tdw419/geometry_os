; DESCRIPTION: Places a blue line segment connecting (111, 87) to (291, 115).
; PLAN: r0=111(x1), r1=87(y1), r2=291(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 87
LDI r2, 291
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
