; DESCRIPTION: Draws a blue rectangle at (212, 8) with width 19 and height 21.
; PLAN: r0=212(x), r1=8(y), r2=19(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 8
LDI r2, 19
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
