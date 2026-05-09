; DESCRIPTION: Places a cyan line segment connecting (304, 101) to (432, 98).
; PLAN: r0=304(x1), r1=101(y1), r2=432(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 101
LDI r2, 432
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
