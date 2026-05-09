; DESCRIPTION: Draws a blue rectangle at (166, 36) with width 47 and height 107.
; PLAN: r0=166(x), r1=36(y), r2=47(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 36
LDI r2, 47
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
