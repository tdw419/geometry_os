; DESCRIPTION: Draws a purple rectangle at (411, 166) with width 98 and height 56.
; PLAN: r0=411(x), r1=166(y), r2=98(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 166
LDI r2, 98
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
