; DESCRIPTION: Composite: . Then Renders a white box of size 41x89 starting at (169, 41). Then Draws a magenta circle centered at (90, 160) with radius 15.
; PLAN: r0=169(x), r1=41(y), r2=41(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=160(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 41x89 starting at (169, 41).
; PLAN: r0=169(x), r1=41(y), r2=41(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 41
LDI r2, 41
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (90, 160) with radius 15.
; PLAN: r0=90(x), r1=160(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 160
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
