; DESCRIPTION: Places a white line segment connecting (117, 76) to (207, 12).
; PLAN: r0=117(x1), r1=76(y1), r2=207(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 76
LDI r2, 207
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
