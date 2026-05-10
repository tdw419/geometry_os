; DESCRIPTION: Renders a white line between points (290, 170) and (99, 82).
; PLAN: r0=290(x1), r1=170(y1), r2=99(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 170
LDI r2, 99
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
