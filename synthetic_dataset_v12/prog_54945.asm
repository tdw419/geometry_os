; DESCRIPTION: Places a white line segment connecting (242, 170) to (301, 212).
; PLAN: r0=242(x1), r1=170(y1), r2=301(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 170
LDI r2, 301
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
