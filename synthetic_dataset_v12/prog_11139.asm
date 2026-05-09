; DESCRIPTION: Places a yellow line segment connecting (283, 165) to (114, 195).
; PLAN: r0=283(x1), r1=165(y1), r2=114(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 165
LDI r2, 114
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
