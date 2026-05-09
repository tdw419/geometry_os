; DESCRIPTION: Places a green line segment connecting (413, 178) to (462, 159).
; PLAN: r0=413(x1), r1=178(y1), r2=462(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 178
LDI r2, 462
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
