; DESCRIPTION: Draws a blue rectangle at (107, 111) with width 99 and height 39.
; PLAN: r0=107(x), r1=111(y), r2=99(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 111
LDI r2, 99
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
