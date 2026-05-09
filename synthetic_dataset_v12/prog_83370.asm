; DESCRIPTION: Places a white line segment connecting (89, 59) to (54, 53).
; PLAN: r0=89(x1), r1=59(y1), r2=54(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 59
LDI r2, 54
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
