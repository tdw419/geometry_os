; DESCRIPTION: Draws a blue rectangle at (198, 148) with width 74 and height 73.
; PLAN: r0=198(x), r1=148(y), r2=74(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 148
LDI r2, 74
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
