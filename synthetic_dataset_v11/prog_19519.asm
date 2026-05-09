; DESCRIPTION: Draws a orange rectangle at (55, 31) with width 103 and height 113.
; PLAN: r0=55(x), r1=31(y), r2=103(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 31
LDI r2, 103
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
