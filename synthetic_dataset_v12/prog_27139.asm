; DESCRIPTION: Draws a red rectangle at (351, 119) with width 116 and height 69.
; PLAN: r0=351(x), r1=119(y), r2=116(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 119
LDI r2, 116
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
