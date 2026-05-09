; DESCRIPTION: Draws a orange rectangle at (364, 121) with width 113 and height 83.
; PLAN: r0=364(x), r1=121(y), r2=113(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 121
LDI r2, 113
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
