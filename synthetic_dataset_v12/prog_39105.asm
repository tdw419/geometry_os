; DESCRIPTION: Places a blue line segment connecting (338, 176) to (209, 63).
; PLAN: r0=338(x1), r1=176(y1), r2=209(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 176
LDI r2, 209
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
