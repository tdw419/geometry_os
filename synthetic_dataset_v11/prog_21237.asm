; DESCRIPTION: Places a black line segment connecting (41, 40) to (146, 148).
; PLAN: r0=41(x1), r1=40(y1), r2=146(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 40
LDI r2, 146
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
