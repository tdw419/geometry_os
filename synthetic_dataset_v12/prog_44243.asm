; DESCRIPTION: Renders a green line between points (23, 60) and (110, 97).
; PLAN: r0=23(x1), r1=60(y1), r2=110(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 60
LDI r2, 110
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
