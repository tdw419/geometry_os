; DESCRIPTION: Places a yellow line segment connecting (107, 40) to (91, 225).
; PLAN: r0=107(x1), r1=40(y1), r2=91(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 40
LDI r2, 91
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
