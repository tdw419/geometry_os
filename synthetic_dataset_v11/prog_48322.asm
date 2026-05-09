; DESCRIPTION: Composite: . Then Places a black circle of radius 41 at center (134, 188). Then Places a black line segment connecting (105, 213) to (33, 122).
; PLAN: r0=134(x), r1=188(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=105(x1), r1=213(y1), r2=33(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 41 at center (134, 188).
; PLAN: r0=134(x), r1=188(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 188
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (105, 213) to (33, 122).
; PLAN: r0=105(x1), r1=213(y1), r2=33(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 213
LDI r2, 33
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
