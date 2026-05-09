; DESCRIPTION: Draws a blue rectangle at (160, 39) with width 35 and height 107.
; PLAN: r0=160(x), r1=39(y), r2=35(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 39
LDI r2, 35
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
