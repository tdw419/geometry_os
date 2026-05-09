; DESCRIPTION: Draws a blue rectangle at (16, 149) with width 114 and height 53.
; PLAN: r0=16(x), r1=149(y), r2=114(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 149
LDI r2, 114
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
