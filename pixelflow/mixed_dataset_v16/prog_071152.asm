; DESCRIPTION: Places a white line segment connecting (41, 137) to (367, 234).
; PLAN: r0=41(x1), r1=137(y1), r2=367(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 137
LDI r2, 367
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
