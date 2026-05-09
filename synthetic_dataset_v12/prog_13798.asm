; DESCRIPTION: Places a cyan line segment connecting (312, 188) to (276, 205).
; PLAN: r0=312(x1), r1=188(y1), r2=276(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 188
LDI r2, 276
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
