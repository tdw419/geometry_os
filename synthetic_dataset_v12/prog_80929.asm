; DESCRIPTION: Draws a orange rectangle at (237, 66) with width 113 and height 69.
; PLAN: r0=237(x), r1=66(y), r2=113(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 66
LDI r2, 113
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
