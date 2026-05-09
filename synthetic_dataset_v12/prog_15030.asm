; DESCRIPTION: Draws a orange rectangle at (72, 143) with width 82 and height 49.
; PLAN: r0=72(x), r1=143(y), r2=82(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 143
LDI r2, 82
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
