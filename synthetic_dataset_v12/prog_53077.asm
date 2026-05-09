; DESCRIPTION: Draws a blue rectangle at (24, 56) with width 64 and height 39.
; PLAN: r0=24(x), r1=56(y), r2=64(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 56
LDI r2, 64
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
