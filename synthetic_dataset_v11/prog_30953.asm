; DESCRIPTION: Places a cyan line segment connecting (178, 201) to (249, 24).
; PLAN: r0=178(x1), r1=201(y1), r2=249(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 201
LDI r2, 249
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
