; DESCRIPTION: Places a cyan line segment connecting (201, 98) to (40, 217).
; PLAN: r0=201(x1), r1=98(y1), r2=40(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 98
LDI r2, 40
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
