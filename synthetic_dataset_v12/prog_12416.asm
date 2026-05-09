; DESCRIPTION: Places a white line segment connecting (310, 41) to (482, 116).
; PLAN: r0=310(x1), r1=41(y1), r2=482(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 41
LDI r2, 482
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
