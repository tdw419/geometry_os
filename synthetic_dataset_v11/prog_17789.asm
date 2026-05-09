; DESCRIPTION: Draws a magenta rectangle at (192, 7) with width 53 and height 41.
; PLAN: r0=192(x), r1=7(y), r2=53(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 7
LDI r2, 53
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
