; DESCRIPTION: Draws a blue rectangle at (28, 65) with width 93 and height 107.
; PLAN: r0=28(x), r1=65(y), r2=93(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 65
LDI r2, 93
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
