; DESCRIPTION: Places a green line segment connecting (406, 153) to (78, 183).
; PLAN: r0=406(x1), r1=153(y1), r2=78(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 153
LDI r2, 78
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
