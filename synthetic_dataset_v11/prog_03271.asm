; DESCRIPTION: Draws a blue rectangle at (157, 103) with width 29 and height 86.
; PLAN: r0=157(x), r1=103(y), r2=29(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 103
LDI r2, 29
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
