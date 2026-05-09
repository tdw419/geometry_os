; DESCRIPTION: Composite: . Then Draws a orange rectangle at (32, 167) with width 51 and height 39. Then Renders a orange disk with center (114, 101) and radius 64.
; PLAN: r0=32(x), r1=167(y), r2=51(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=114(x), r1=101(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (32, 167) with width 51 and height 39.
; PLAN: r0=32(x), r1=167(y), r2=51(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 167
LDI r2, 51
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (114, 101) and radius 64.
; PLAN: r0=114(x), r1=101(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 101
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
