; DESCRIPTION: Draws a blue rectangle at (134, 57) with width 43 and height 32.
; PLAN: r0=134(x), r1=57(y), r2=43(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 57
LDI r2, 43
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
