; DESCRIPTION: Draws a blue rectangle at (107, 25) with width 61 and height 105.
; PLAN: r0=107(x), r1=25(y), r2=61(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 25
LDI r2, 61
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
