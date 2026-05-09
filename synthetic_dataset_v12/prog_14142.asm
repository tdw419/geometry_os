; DESCRIPTION: Places a green line segment connecting (225, 43) to (248, 186).
; PLAN: r0=225(x1), r1=43(y1), r2=248(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 43
LDI r2, 248
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
