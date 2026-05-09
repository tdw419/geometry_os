; DESCRIPTION: Draws a blue rectangle at (197, 130) with width 12 and height 77.
; PLAN: r0=197(x), r1=130(y), r2=12(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 130
LDI r2, 12
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
