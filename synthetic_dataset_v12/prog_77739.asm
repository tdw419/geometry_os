; DESCRIPTION: Draws a orange rectangle at (289, 113) with width 74 and height 71.
; PLAN: r0=289(x), r1=113(y), r2=74(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 113
LDI r2, 74
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
