; DESCRIPTION: Draws a blue rectangle at (66, 55) with width 32 and height 101.
; PLAN: r0=66(x), r1=55(y), r2=32(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 55
LDI r2, 32
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
