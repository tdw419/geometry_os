; DESCRIPTION: Places a cyan line segment connecting (283, 2) to (84, 140).
; PLAN: r0=283(x1), r1=2(y1), r2=84(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 2
LDI r2, 84
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
