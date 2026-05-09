; DESCRIPTION: Draws a orange rectangle at (183, 173) with width 116 and height 53.
; PLAN: r0=183(x), r1=173(y), r2=116(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 173
LDI r2, 116
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
