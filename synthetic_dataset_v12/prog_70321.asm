; DESCRIPTION: Places a white line segment connecting (66, 225) to (222, 248).
; PLAN: r0=66(x1), r1=225(y1), r2=222(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 225
LDI r2, 222
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
