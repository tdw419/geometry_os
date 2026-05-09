; DESCRIPTION: Places a cyan line segment connecting (170, 139) to (84, 17).
; PLAN: r0=170(x1), r1=139(y1), r2=84(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 139
LDI r2, 84
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
