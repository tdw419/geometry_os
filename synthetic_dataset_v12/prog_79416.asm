; DESCRIPTION: Draws a blue rectangle at (166, 51) with width 109 and height 67.
; PLAN: r0=166(x), r1=51(y), r2=109(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 51
LDI r2, 109
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
