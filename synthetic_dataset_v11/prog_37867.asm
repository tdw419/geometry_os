; DESCRIPTION: Draws a purple rectangle at (196, 121) with width 39 and height 55.
; PLAN: r0=196(x), r1=121(y), r2=39(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 121
LDI r2, 39
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
