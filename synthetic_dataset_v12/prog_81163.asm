; DESCRIPTION: Draws a red rectangle at (47, 172) with width 70 and height 39.
; PLAN: r0=47(x), r1=172(y), r2=70(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 172
LDI r2, 70
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
