; DESCRIPTION: Places a blue line segment connecting (237, 232) to (252, 179).
; PLAN: r0=237(x1), r1=232(y1), r2=252(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 232
LDI r2, 252
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
