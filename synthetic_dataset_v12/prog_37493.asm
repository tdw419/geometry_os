; DESCRIPTION: Places a black line segment connecting (154, 103) to (159, 41).
; PLAN: r0=154(x1), r1=103(y1), r2=159(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 103
LDI r2, 159
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
