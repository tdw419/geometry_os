; DESCRIPTION: Places a green line segment connecting (300, 97) to (61, 102).
; PLAN: r0=300(x1), r1=97(y1), r2=61(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 97
LDI r2, 61
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
