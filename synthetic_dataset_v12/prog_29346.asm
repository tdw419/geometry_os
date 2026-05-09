; DESCRIPTION: Draws a magenta rectangle at (352, 189) with width 39 and height 41.
; PLAN: r0=352(x), r1=189(y), r2=39(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 189
LDI r2, 39
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
