; DESCRIPTION: Draws a blue rectangle at (157, 166) with width 57 and height 90.
; PLAN: r0=157(x), r1=166(y), r2=57(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 166
LDI r2, 57
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
