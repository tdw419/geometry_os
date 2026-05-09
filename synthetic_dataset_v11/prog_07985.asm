; DESCRIPTION: Composite: . Then Draws a black line from (223, 15) to (139, 18). Then Renders a purple box of size 101x109 starting at (41, 24).
; PLAN: r0=223(x1), r1=15(y1), r2=139(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=24(y), r2=101(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (223, 15) to (139, 18).
; PLAN: r0=223(x1), r1=15(y1), r2=139(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 15
LDI r2, 139
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 101x109 starting at (41, 24).
; PLAN: r0=41(x), r1=24(y), r2=101(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 24
LDI r2, 101
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
