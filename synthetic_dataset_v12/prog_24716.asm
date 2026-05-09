; DESCRIPTION: Places a green line segment connecting (310, 120) to (84, 222).
; PLAN: r0=310(x1), r1=120(y1), r2=84(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 120
LDI r2, 84
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
