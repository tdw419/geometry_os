; DESCRIPTION: Composite: . Then Draws a orange rectangle at (212, 43) with width 41 and height 28. Then Renders a orange disk with center (218, 96) and radius 13.
; PLAN: r0=212(x), r1=43(y), r2=41(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=218(x), r1=96(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (212, 43) with width 41 and height 28.
; PLAN: r0=212(x), r1=43(y), r2=41(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 43
LDI r2, 41
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (218, 96) and radius 13.
; PLAN: r0=218(x), r1=96(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 96
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
