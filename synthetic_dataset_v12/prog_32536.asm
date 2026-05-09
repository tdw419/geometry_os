; DESCRIPTION: Draws a orange rectangle at (397, 104) with width 113 and height 23.
; PLAN: r0=397(x), r1=104(y), r2=113(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 104
LDI r2, 113
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
