; DESCRIPTION: Composite: . Then Places a orange circle of radius 42 at center (51, 183). Then Draws a white rectangle at (96, 10) with width 105 and height 41.
; PLAN: r0=51(x), r1=183(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=96(x), r1=10(y), r2=105(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 42 at center (51, 183).
; PLAN: r0=51(x), r1=183(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 183
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (96, 10) with width 105 and height 41.
; PLAN: r0=96(x), r1=10(y), r2=105(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 10
LDI r2, 105
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
