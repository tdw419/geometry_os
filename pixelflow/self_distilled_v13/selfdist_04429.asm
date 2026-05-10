; DESCRIPTION: Draws a blue rectangle at (213, 60) with width 37 and height 22.
; PLAN: r0=213(x), r1=60(y), r2=37(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 60
LDI r2, 37
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
