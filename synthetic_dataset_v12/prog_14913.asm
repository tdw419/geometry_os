; DESCRIPTION: Draws a orange rectangle at (66, 36) with width 116 and height 112.
; PLAN: r0=66(x), r1=36(y), r2=116(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 36
LDI r2, 116
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
