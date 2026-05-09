; DESCRIPTION: Draws a blue rectangle at (159, 125) with width 37 and height 72.
; PLAN: r0=159(x), r1=125(y), r2=37(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 125
LDI r2, 37
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
