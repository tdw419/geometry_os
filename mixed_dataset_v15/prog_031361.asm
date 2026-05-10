; DESCRIPTION: Draws a blue rectangle at (214, 39) with width 101 and height 97.
; PLAN: r0=214(x), r1=39(y), r2=101(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 39
LDI r2, 101
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
