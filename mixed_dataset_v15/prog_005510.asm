; DESCRIPTION: Draws a blue rectangle at (12, 128) with width 99 and height 113.
; PLAN: r0=12(x), r1=128(y), r2=99(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 128
LDI r2, 99
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
