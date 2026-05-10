; DESCRIPTION: Draws a red rectangle at (6, 83) with width 83 and height 69.
; PLAN: r0=6(x), r1=83(y), r2=83(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 83
LDI r2, 83
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
