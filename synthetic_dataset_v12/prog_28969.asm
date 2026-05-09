; DESCRIPTION: Draws a red rectangle at (385, 110) with width 32 and height 17.
; PLAN: r0=385(x), r1=110(y), r2=32(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 110
LDI r2, 32
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
