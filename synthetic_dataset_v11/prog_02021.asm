; DESCRIPTION: Composite: . Then Draws a black rectangle at (53, 134) with width 60 and height 110. Then Places a orange line segment connecting (190, 235) to (130, 76).
; PLAN: r0=53(x), r1=134(y), r2=60(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=190(x1), r1=235(y1), r2=130(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (53, 134) with width 60 and height 110.
; PLAN: r0=53(x), r1=134(y), r2=60(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 134
LDI r2, 60
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (190, 235) to (130, 76).
; PLAN: r0=190(x1), r1=235(y1), r2=130(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 235
LDI r2, 130
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
