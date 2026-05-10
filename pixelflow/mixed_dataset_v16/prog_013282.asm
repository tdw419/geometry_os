; DESCRIPTION: Draws a orange rectangle at (20, 148) with width 72 and height 30.
; PLAN: r0=20(x), r1=148(y), r2=72(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 148
LDI r2, 72
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
