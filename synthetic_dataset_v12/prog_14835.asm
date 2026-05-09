; DESCRIPTION: Draws a orange rectangle at (33, 36) with width 116 and height 29.
; PLAN: r0=33(x), r1=36(y), r2=116(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 36
LDI r2, 116
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
