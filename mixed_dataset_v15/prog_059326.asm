; DESCRIPTION: Draws a red rectangle at (285, 2) with width 17 and height 110.
; PLAN: r0=285(x), r1=2(y), r2=17(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 2
LDI r2, 17
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
