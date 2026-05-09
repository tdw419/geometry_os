; DESCRIPTION: Draws a blue rectangle at (420, 140) with width 21 and height 25.
; PLAN: r0=420(x), r1=140(y), r2=21(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 140
LDI r2, 21
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
