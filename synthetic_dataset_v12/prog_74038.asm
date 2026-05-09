; DESCRIPTION: Draws a blue rectangle at (268, 26) with width 53 and height 63.
; PLAN: r0=268(x), r1=26(y), r2=53(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 26
LDI r2, 53
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
