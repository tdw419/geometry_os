; DESCRIPTION: Composite: . Then Renders a orange line between points (26, 164) and (15, 190). Then Places a black circle of radius 30 at center (41, 94).
; PLAN: r0=26(x1), r1=164(y1), r2=15(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=94(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (26, 164) and (15, 190).
; PLAN: r0=26(x1), r1=164(y1), r2=15(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 164
LDI r2, 15
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 30 at center (41, 94).
; PLAN: r0=41(x), r1=94(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 94
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
