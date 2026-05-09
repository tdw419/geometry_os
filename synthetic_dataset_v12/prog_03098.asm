; DESCRIPTION: Places a cyan line segment connecting (40, 65) to (2, 85).
; PLAN: r0=40(x1), r1=65(y1), r2=2(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 65
LDI r2, 2
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
