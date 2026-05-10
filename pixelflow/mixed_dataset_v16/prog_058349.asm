; DESCRIPTION: Draws a orange rectangle at (299, 58) with width 71 and height 29.
; PLAN: r0=299(x), r1=58(y), r2=71(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 58
LDI r2, 71
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
