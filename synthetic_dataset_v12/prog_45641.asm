; DESCRIPTION: Draws a blue rectangle at (454, 98) with width 29 and height 73.
; PLAN: r0=454(x), r1=98(y), r2=29(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 98
LDI r2, 29
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
