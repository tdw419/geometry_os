; DESCRIPTION: Composite: . Then Renders a purple box of size 107x119 starting at (141, 130). Then Creates a orange circular shape at (41, 199) with radius 32.
; PLAN: r0=141(x), r1=130(y), r2=107(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=199(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 107x119 starting at (141, 130).
; PLAN: r0=141(x), r1=130(y), r2=107(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 130
LDI r2, 107
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (41, 199) with radius 32.
; PLAN: r0=41(x), r1=199(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 199
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
