; DESCRIPTION: Draws a blue rectangle at (167, 135) with width 86 and height 70.
; PLAN: r0=167(x), r1=135(y), r2=86(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 135
LDI r2, 86
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
