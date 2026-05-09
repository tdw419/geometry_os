; DESCRIPTION: Draws a orange rectangle at (469, 148) with width 34 and height 90.
; PLAN: r0=469(x), r1=148(y), r2=34(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 148
LDI r2, 34
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
