; DESCRIPTION: Draws a red rectangle at (321, 17) with width 62 and height 20.
; PLAN: r0=321(x), r1=17(y), r2=62(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 17
LDI r2, 62
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
