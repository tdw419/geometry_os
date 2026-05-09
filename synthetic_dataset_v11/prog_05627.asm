; DESCRIPTION: Places a white line segment connecting (41, 56) to (32, 75).
; PLAN: r0=41(x1), r1=56(y1), r2=32(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 56
LDI r2, 32
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
