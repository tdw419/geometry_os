; DESCRIPTION: Draws a orange rectangle at (426, 104) with width 39 and height 53.
; PLAN: r0=426(x), r1=104(y), r2=39(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 104
LDI r2, 39
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
