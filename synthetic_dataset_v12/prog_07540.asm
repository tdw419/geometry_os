; DESCRIPTION: Places a black line segment connecting (164, 41) to (126, 41).
; PLAN: r0=164(x1), r1=41(y1), r2=126(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 41
LDI r2, 126
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
