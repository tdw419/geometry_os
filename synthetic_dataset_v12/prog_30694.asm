; DESCRIPTION: Places a cyan line segment connecting (110, 158) to (229, 74).
; PLAN: r0=110(x1), r1=158(y1), r2=229(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 158
LDI r2, 229
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
