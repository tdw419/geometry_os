; DESCRIPTION: Draws a blue rectangle at (397, 205) with width 86 and height 13.
; PLAN: r0=397(x), r1=205(y), r2=86(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 205
LDI r2, 86
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
