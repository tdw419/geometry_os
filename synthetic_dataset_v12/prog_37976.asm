; DESCRIPTION: Places a white line segment connecting (181, 114) to (5, 62).
; PLAN: r0=181(x1), r1=114(y1), r2=5(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 114
LDI r2, 5
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
