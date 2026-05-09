; DESCRIPTION: Places a green line segment connecting (261, 166) to (81, 159).
; PLAN: r0=261(x1), r1=166(y1), r2=81(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 166
LDI r2, 81
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
