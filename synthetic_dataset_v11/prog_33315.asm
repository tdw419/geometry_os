; DESCRIPTION: Draws a blue rectangle at (195, 56) with width 12 and height 60.
; PLAN: r0=195(x), r1=56(y), r2=12(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 56
LDI r2, 12
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
