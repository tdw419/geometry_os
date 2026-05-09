; DESCRIPTION: Places a white line segment connecting (282, 241) to (61, 41).
; PLAN: r0=282(x1), r1=241(y1), r2=61(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 241
LDI r2, 61
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
