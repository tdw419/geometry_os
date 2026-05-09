; DESCRIPTION: Draws a orange rectangle at (330, 25) with width 28 and height 114.
; PLAN: r0=330(x), r1=25(y), r2=28(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 25
LDI r2, 28
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
