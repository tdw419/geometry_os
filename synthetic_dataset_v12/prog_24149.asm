; DESCRIPTION: Draws a blue rectangle at (452, 86) with width 33 and height 40.
; PLAN: r0=452(x), r1=86(y), r2=33(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 86
LDI r2, 33
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
