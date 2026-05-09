; DESCRIPTION: Draws a orange rectangle at (346, 100) with width 14 and height 90.
; PLAN: r0=346(x), r1=100(y), r2=14(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 100
LDI r2, 14
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
