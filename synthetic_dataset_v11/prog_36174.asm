; DESCRIPTION: Draws a blue rectangle at (107, 51) with width 40 and height 57.
; PLAN: r0=107(x), r1=51(y), r2=40(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 51
LDI r2, 40
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
