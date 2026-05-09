; DESCRIPTION: Places a red line segment connecting (255, 170) to (9, 150).
; PLAN: r0=255(x1), r1=170(y1), r2=9(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 170
LDI r2, 9
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
