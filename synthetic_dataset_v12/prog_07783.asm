; DESCRIPTION: Draws a red rectangle at (382, 5) with width 105 and height 62.
; PLAN: r0=382(x), r1=5(y), r2=105(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 5
LDI r2, 105
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
