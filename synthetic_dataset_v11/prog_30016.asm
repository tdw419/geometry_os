; DESCRIPTION: Places a cyan line segment connecting (58, 123) to (40, 75).
; PLAN: r0=58(x1), r1=123(y1), r2=40(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 123
LDI r2, 40
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
