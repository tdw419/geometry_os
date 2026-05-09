; DESCRIPTION: Places a cyan line segment connecting (432, 58) to (47, 148).
; PLAN: r0=432(x1), r1=58(y1), r2=47(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 58
LDI r2, 47
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
