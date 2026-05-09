; DESCRIPTION: Places a blue line segment connecting (249, 111) to (76, 178).
; PLAN: r0=249(x1), r1=111(y1), r2=76(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 111
LDI r2, 76
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
