; DESCRIPTION: Draws a orange rectangle at (182, 17) with width 57 and height 17.
; PLAN: r0=182(x), r1=17(y), r2=57(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 17
LDI r2, 57
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
