; DESCRIPTION: Places a cyan line segment connecting (9, 246) to (204, 201).
; PLAN: r0=9(x1), r1=246(y1), r2=204(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 246
LDI r2, 204
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
