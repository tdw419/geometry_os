; DESCRIPTION: Places a cyan line segment connecting (430, 89) to (212, 244).
; PLAN: r0=430(x1), r1=89(y1), r2=212(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 89
LDI r2, 212
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
