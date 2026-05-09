; DESCRIPTION: Places a white line segment connecting (55, 210) to (194, 41).
; PLAN: r0=55(x1), r1=210(y1), r2=194(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 210
LDI r2, 194
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
