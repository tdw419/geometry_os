; DESCRIPTION: Places a green line segment connecting (81, 139) to (19, 187).
; PLAN: r0=81(x1), r1=139(y1), r2=19(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 139
LDI r2, 19
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
