; DESCRIPTION: Places a white line segment connecting (99, 244) to (69, 114).
; PLAN: r0=99(x1), r1=244(y1), r2=69(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 244
LDI r2, 69
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
