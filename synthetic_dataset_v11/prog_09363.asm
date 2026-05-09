; DESCRIPTION: Places a cyan line segment connecting (91, 123) to (176, 89).
; PLAN: r0=91(x1), r1=123(y1), r2=176(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 123
LDI r2, 176
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
