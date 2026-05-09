; DESCRIPTION: Renders a green line between points (204, 170) and (439, 56).
; PLAN: r0=204(x1), r1=170(y1), r2=439(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 170
LDI r2, 439
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
