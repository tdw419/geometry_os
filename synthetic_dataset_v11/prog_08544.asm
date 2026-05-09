; DESCRIPTION: Composite: . Then Places a white line segment connecting (212, 84) to (152, 69). Then Places a yellow dot at position (101, 35).
; PLAN: r0=212(x1), r1=84(y1), r2=152(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=101(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (212, 84) to (152, 69).
; PLAN: r0=212(x1), r1=84(y1), r2=152(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 84
LDI r2, 152
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (101, 35).
; PLAN: r0=101(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
