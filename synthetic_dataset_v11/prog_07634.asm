; DESCRIPTION: Places a blue line segment connecting (42, 170) to (40, 178).
; PLAN: r0=42(x1), r1=170(y1), r2=40(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 170
LDI r2, 40
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
