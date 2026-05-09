; DESCRIPTION: Draws a blue rectangle at (165, 73) with width 18 and height 10.
; PLAN: r0=165(x), r1=73(y), r2=18(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 73
LDI r2, 18
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
