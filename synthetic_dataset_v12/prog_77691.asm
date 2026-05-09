; DESCRIPTION: Draws a red rectangle at (296, 24) with width 47 and height 43.
; PLAN: r0=296(x), r1=24(y), r2=47(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 24
LDI r2, 47
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
