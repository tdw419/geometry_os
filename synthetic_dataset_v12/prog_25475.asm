; DESCRIPTION: Composite: Draws a orange rectangle at (123, 6) with width 43 and height 47 then Sets a single white pixel at (5, 248).
; PLAN: r0=123(x), r1=6(y), r2=43(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x), r6=248(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 6
LDI r2, 43
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 248
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
