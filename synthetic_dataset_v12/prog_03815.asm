; DESCRIPTION: Places a cyan line segment connecting (137, 45) to (40, 118).
; PLAN: r0=137(x1), r1=45(y1), r2=40(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 45
LDI r2, 40
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
