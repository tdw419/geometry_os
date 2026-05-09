; DESCRIPTION: Places a yellow line segment connecting (339, 195) to (420, 245).
; PLAN: r0=339(x1), r1=195(y1), r2=420(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 195
LDI r2, 420
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
