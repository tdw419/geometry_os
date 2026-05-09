; DESCRIPTION: Places a white line segment connecting (18, 58) to (122, 223).
; PLAN: r0=18(x1), r1=58(y1), r2=122(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 58
LDI r2, 122
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
