; DESCRIPTION: Places a white line segment connecting (88, 197) to (60, 122).
; PLAN: r0=88(x1), r1=197(y1), r2=60(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 197
LDI r2, 60
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
