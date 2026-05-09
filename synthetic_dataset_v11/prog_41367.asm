; DESCRIPTION: Draws a green line from (76, 156) to (31, 139).
; PLAN: r0=76(x1), r1=156(y1), r2=31(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 156
LDI r2, 31
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
