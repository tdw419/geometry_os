; DESCRIPTION: Draws a red rectangle at (400, 43) with width 81 and height 119.
; PLAN: r0=400(x), r1=43(y), r2=81(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 43
LDI r2, 81
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
