; DESCRIPTION: Draws a red rectangle at (14, 142) with width 30 and height 76.
; PLAN: r0=14(x), r1=142(y), r2=30(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 142
LDI r2, 30
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
