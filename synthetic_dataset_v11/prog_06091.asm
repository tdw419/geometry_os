; DESCRIPTION: Composite: . Then Draws a orange rectangle at (108, 188) with width 85 and height 18. Then Renders a black disk with center (167, 180) and radius 67.
; PLAN: r0=108(x), r1=188(y), r2=85(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=167(x), r1=180(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (108, 188) with width 85 and height 18.
; PLAN: r0=108(x), r1=188(y), r2=85(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 188
LDI r2, 85
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (167, 180) and radius 67.
; PLAN: r0=167(x), r1=180(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 180
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
