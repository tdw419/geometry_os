; DESCRIPTION: Places a yellow line segment connecting (425, 197) to (270, 139).
; PLAN: r0=425(x1), r1=197(y1), r2=270(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 197
LDI r2, 270
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
