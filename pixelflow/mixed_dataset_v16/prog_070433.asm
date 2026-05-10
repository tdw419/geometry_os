; DESCRIPTION: Draws a red rectangle at (266, 159) with width 116 and height 30.
; PLAN: r0=266(x), r1=159(y), r2=116(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 159
LDI r2, 116
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
