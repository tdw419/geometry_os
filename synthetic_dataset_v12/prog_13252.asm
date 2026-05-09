; DESCRIPTION: Places a white line segment connecting (148, 223) to (490, 244).
; PLAN: r0=148(x1), r1=223(y1), r2=490(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 223
LDI r2, 490
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
