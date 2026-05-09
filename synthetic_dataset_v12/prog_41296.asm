; DESCRIPTION: Places a cyan line segment connecting (351, 40) to (407, 74).
; PLAN: r0=351(x1), r1=40(y1), r2=407(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 40
LDI r2, 407
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
