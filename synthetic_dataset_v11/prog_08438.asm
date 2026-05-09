; DESCRIPTION: Draws a blue rectangle at (57, 11) with width 112 and height 39.
; PLAN: r0=57(x), r1=11(y), r2=112(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 11
LDI r2, 112
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
