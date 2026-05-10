; DESCRIPTION: Draws a blue rectangle at (4, 27) with width 114 and height 112.
; PLAN: r0=4(x), r1=27(y), r2=114(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 27
LDI r2, 114
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
