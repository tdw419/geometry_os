; DESCRIPTION: Draws a orange rectangle at (265, 151) with width 18 and height 57.
; PLAN: r0=265(x), r1=151(y), r2=18(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 151
LDI r2, 18
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
