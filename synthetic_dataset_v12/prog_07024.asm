; DESCRIPTION: Places a green line segment connecting (350, 23) to (261, 44).
; PLAN: r0=350(x1), r1=23(y1), r2=261(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 23
LDI r2, 261
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
