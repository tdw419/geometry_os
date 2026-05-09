; DESCRIPTION: Places a cyan line segment connecting (219, 170) to (106, 122).
; PLAN: r0=219(x1), r1=170(y1), r2=106(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 170
LDI r2, 106
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
