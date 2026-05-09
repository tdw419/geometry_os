; DESCRIPTION: Places a cyan line segment connecting (396, 170) to (160, 30).
; PLAN: r0=396(x1), r1=170(y1), r2=160(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 170
LDI r2, 160
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
