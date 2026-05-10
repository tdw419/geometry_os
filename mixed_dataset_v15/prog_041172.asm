; DESCRIPTION: Draws a blue rectangle at (61, 148) with width 25 and height 19.
; PLAN: r0=61(x), r1=148(y), r2=25(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 148
LDI r2, 25
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
