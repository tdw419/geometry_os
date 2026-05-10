; DESCRIPTION: Draws a blue rectangle at (372, 132) with width 76 and height 56.
; PLAN: r0=372(x), r1=132(y), r2=76(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 132
LDI r2, 76
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
