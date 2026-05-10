; DESCRIPTION: Draws a orange rectangle at (107, 130) with width 36 and height 76.
; PLAN: r0=107(x), r1=130(y), r2=36(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 130
LDI r2, 36
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
