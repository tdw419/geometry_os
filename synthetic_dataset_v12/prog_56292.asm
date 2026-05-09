; DESCRIPTION: Places a blue line segment connecting (273, 215) to (291, 140).
; PLAN: r0=273(x1), r1=215(y1), r2=291(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 215
LDI r2, 291
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
