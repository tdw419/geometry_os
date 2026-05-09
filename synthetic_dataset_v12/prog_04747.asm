; DESCRIPTION: Draws a orange rectangle at (167, 90) with width 72 and height 61.
; PLAN: r0=167(x), r1=90(y), r2=72(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 90
LDI r2, 72
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
