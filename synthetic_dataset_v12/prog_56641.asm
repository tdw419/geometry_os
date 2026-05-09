; DESCRIPTION: Draws a black rectangle at (28, 39) with width 10 and height 78.
; PLAN: r0=28(x), r1=39(y), r2=10(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 39
LDI r2, 10
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
