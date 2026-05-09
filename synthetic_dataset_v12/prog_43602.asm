; DESCRIPTION: Draws a orange rectangle at (309, 143) with width 101 and height 92.
; PLAN: r0=309(x), r1=143(y), r2=101(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 143
LDI r2, 101
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
