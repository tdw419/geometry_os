; DESCRIPTION: Places a blue line segment connecting (272, 54) to (292, 87).
; PLAN: r0=272(x1), r1=54(y1), r2=292(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 54
LDI r2, 292
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
