; DESCRIPTION: Draws a magenta rectangle at (436, 211) with width 34 and height 41.
; PLAN: r0=436(x), r1=211(y), r2=34(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 211
LDI r2, 34
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
