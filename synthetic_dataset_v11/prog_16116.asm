; DESCRIPTION: Draws a orange rectangle at (113, 156) with width 66 and height 82.
; PLAN: r0=113(x), r1=156(y), r2=66(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 156
LDI r2, 66
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
