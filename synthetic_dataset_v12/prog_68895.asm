; DESCRIPTION: Draws a red rectangle at (151, 61) with width 17 and height 43.
; PLAN: r0=151(x), r1=61(y), r2=17(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 61
LDI r2, 17
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
