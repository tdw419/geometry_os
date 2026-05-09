; DESCRIPTION: Places a blue line segment connecting (420, 175) to (272, 23).
; PLAN: r0=420(x1), r1=175(y1), r2=272(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 175
LDI r2, 272
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
