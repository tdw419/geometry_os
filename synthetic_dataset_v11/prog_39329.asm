; DESCRIPTION: Places a cyan line segment connecting (116, 201) to (249, 70).
; PLAN: r0=116(x1), r1=201(y1), r2=249(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 201
LDI r2, 249
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
