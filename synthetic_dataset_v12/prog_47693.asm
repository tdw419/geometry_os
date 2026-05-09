; DESCRIPTION: Draws a red rectangle at (407, 37) with width 17 and height 38.
; PLAN: r0=407(x), r1=37(y), r2=17(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 37
LDI r2, 17
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
