; DESCRIPTION: Renders a yellow line between points (258, 170) and (28, 165).
; PLAN: r0=258(x1), r1=170(y1), r2=28(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 170
LDI r2, 28
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
