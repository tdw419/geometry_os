; DESCRIPTION: Draws a orange rectangle at (5, 74) with width 82 and height 66.
; PLAN: r0=5(x), r1=74(y), r2=82(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 74
LDI r2, 82
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
