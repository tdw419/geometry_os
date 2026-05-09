; DESCRIPTION: Draws a orange rectangle at (287, 1) with width 12 and height 30.
; PLAN: r0=287(x), r1=1(y), r2=12(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 1
LDI r2, 12
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
