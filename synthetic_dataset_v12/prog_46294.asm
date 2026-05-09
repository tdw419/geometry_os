; DESCRIPTION: Places a green line segment connecting (427, 175) to (313, 219).
; PLAN: r0=427(x1), r1=175(y1), r2=313(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 175
LDI r2, 313
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
