; DESCRIPTION: Places a yellow line segment connecting (56, 170) to (42, 142).
; PLAN: r0=56(x1), r1=170(y1), r2=42(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 170
LDI r2, 42
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
