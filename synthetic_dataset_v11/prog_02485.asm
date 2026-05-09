; DESCRIPTION: Places a green line segment connecting (111, 175) to (3, 13).
; PLAN: r0=111(x1), r1=175(y1), r2=3(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 175
LDI r2, 3
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
