; DESCRIPTION: Places a cyan line segment connecting (227, 87) to (225, 97).
; PLAN: r0=227(x1), r1=87(y1), r2=225(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 87
LDI r2, 225
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
