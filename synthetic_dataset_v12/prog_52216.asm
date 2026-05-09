; DESCRIPTION: Places a green line segment connecting (59, 13) to (280, 110).
; PLAN: r0=59(x1), r1=13(y1), r2=280(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 13
LDI r2, 280
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
