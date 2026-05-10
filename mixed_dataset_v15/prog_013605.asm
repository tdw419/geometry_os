; DESCRIPTION: Draws a red rectangle at (17, 135) with width 52 and height 35.
; PLAN: r0=17(x), r1=135(y), r2=52(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 135
LDI r2, 52
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
