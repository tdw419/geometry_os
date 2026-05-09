; DESCRIPTION: Places a yellow line segment connecting (53, 151) to (354, 97).
; PLAN: r0=53(x1), r1=151(y1), r2=354(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 151
LDI r2, 354
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
