; DESCRIPTION: Places a yellow line segment connecting (207, 37) to (225, 204).
; PLAN: r0=207(x1), r1=37(y1), r2=225(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 37
LDI r2, 225
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
