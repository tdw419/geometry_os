; DESCRIPTION: Places a green line segment connecting (311, 175) to (106, 195).
; PLAN: r0=311(x1), r1=175(y1), r2=106(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 175
LDI r2, 106
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
