; DESCRIPTION: Draws a orange rectangle at (1, 5) with width 56 and height 113.
; PLAN: r0=1(x), r1=5(y), r2=56(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 5
LDI r2, 56
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
