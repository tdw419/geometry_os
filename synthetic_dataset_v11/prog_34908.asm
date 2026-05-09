; DESCRIPTION: Composite: . Then Renders a purple box of size 61x62 starting at (107, 86). Then Draws a red circle centered at (41, 40) with radius 31.
; PLAN: r0=107(x), r1=86(y), r2=61(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=40(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 61x62 starting at (107, 86).
; PLAN: r0=107(x), r1=86(y), r2=61(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 86
LDI r2, 61
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (41, 40) with radius 31.
; PLAN: r0=41(x), r1=40(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 40
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
