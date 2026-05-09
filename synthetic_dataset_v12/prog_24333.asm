; DESCRIPTION: Draws a red rectangle at (418, 6) with width 62 and height 43.
; PLAN: r0=418(x), r1=6(y), r2=62(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 6
LDI r2, 62
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
