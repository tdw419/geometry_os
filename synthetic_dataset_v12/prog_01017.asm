; DESCRIPTION: Places a black line segment connecting (41, 98) to (205, 193).
; PLAN: r0=41(x1), r1=98(y1), r2=205(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 98
LDI r2, 205
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
