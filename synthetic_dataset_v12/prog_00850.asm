; DESCRIPTION: Places a green line segment connecting (451, 79) to (37, 219).
; PLAN: r0=451(x1), r1=79(y1), r2=37(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 79
LDI r2, 37
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
