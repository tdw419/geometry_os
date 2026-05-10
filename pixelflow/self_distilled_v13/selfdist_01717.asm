; DESCRIPTION: Draws a blue rectangle at (310, 63) with width 90 and height 93.
; PLAN: r0=310(x), r1=63(y), r2=90(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 63
LDI r2, 90
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
