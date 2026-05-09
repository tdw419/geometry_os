; DESCRIPTION: Places a green line segment connecting (179, 43) to (207, 240).
; PLAN: r0=179(x1), r1=43(y1), r2=207(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 43
LDI r2, 207
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
