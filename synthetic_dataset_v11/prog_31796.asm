; DESCRIPTION: Draws a red rectangle at (23, 17) with width 116 and height 43.
; PLAN: r0=23(x), r1=17(y), r2=116(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 17
LDI r2, 116
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
