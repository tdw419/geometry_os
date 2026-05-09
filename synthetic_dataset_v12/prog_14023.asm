; DESCRIPTION: Places a cyan line segment connecting (427, 201) to (52, 222).
; PLAN: r0=427(x1), r1=201(y1), r2=52(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 201
LDI r2, 52
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
