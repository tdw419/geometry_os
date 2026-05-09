; DESCRIPTION: Places a green line segment connecting (114, 223) to (226, 78).
; PLAN: r0=114(x1), r1=223(y1), r2=226(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 223
LDI r2, 226
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
