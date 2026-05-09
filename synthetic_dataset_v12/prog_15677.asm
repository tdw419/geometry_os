; DESCRIPTION: Renders a green line between points (501, 100) and (283, 97).
; PLAN: r0=501(x1), r1=100(y1), r2=283(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 100
LDI r2, 283
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
