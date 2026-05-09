; DESCRIPTION: Draws a blue rectangle at (213, 105) with width 40 and height 21.
; PLAN: r0=213(x), r1=105(y), r2=40(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 105
LDI r2, 40
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
