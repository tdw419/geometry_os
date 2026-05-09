; DESCRIPTION: Draws a orange rectangle at (276, 14) with width 53 and height 103.
; PLAN: r0=276(x), r1=14(y), r2=53(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 14
LDI r2, 53
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
