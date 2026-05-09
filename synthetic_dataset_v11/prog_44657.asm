; DESCRIPTION: Places a white line segment connecting (240, 41) to (153, 112).
; PLAN: r0=240(x1), r1=41(y1), r2=153(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 41
LDI r2, 153
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
