; DESCRIPTION: Places a cyan line segment connecting (231, 200) to (448, 75).
; PLAN: r0=231(x1), r1=200(y1), r2=448(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 200
LDI r2, 448
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
