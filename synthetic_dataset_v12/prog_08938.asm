; DESCRIPTION: Draws a red rectangle at (282, 75) with width 65 and height 116.
; PLAN: r0=282(x), r1=75(y), r2=65(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 75
LDI r2, 65
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
