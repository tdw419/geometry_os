; DESCRIPTION: Places a yellow line segment connecting (148, 223) to (375, 44).
; PLAN: r0=148(x1), r1=223(y1), r2=375(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 223
LDI r2, 375
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
