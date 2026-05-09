; DESCRIPTION: Places a blue line segment connecting (176, 220) to (18, 232).
; PLAN: r0=176(x1), r1=220(y1), r2=18(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 220
LDI r2, 18
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
