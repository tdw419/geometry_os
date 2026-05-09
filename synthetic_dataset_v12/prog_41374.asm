; DESCRIPTION: Places a cyan line segment connecting (13, 198) to (98, 102).
; PLAN: r0=13(x1), r1=198(y1), r2=98(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 198
LDI r2, 98
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
