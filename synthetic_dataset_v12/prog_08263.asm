; DESCRIPTION: Places a cyan line segment connecting (40, 158) to (310, 232).
; PLAN: r0=40(x1), r1=158(y1), r2=310(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 158
LDI r2, 310
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
