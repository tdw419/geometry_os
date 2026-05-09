; DESCRIPTION: Draws a blue rectangle at (43, 166) with width 115 and height 16.
; PLAN: r0=43(x), r1=166(y), r2=115(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 166
LDI r2, 115
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
