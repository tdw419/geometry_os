; DESCRIPTION: Places a green line segment connecting (86, 16) to (41, 139).
; PLAN: r0=86(x1), r1=16(y1), r2=41(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 16
LDI r2, 41
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
