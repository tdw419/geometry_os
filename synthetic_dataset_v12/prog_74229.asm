; DESCRIPTION: Places a yellow line segment connecting (225, 178) to (15, 246).
; PLAN: r0=225(x1), r1=178(y1), r2=15(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 178
LDI r2, 15
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
