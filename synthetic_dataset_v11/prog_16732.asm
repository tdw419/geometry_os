; DESCRIPTION: Draws a orange rectangle at (182, 81) with width 57 and height 38.
; PLAN: r0=182(x), r1=81(y), r2=57(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 81
LDI r2, 57
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
