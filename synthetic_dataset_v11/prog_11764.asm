; DESCRIPTION: Places a white line segment connecting (41, 41) to (209, 47).
; PLAN: r0=41(x1), r1=41(y1), r2=209(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 41
LDI r2, 209
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
