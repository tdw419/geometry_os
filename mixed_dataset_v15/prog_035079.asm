; DESCRIPTION: Draws a orange rectangle at (373, 151) with width 74 and height 81.
; PLAN: r0=373(x), r1=151(y), r2=74(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 151
LDI r2, 74
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
