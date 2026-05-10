; DESCRIPTION: Draws a blue rectangle at (274, 121) with width 39 and height 46.
; PLAN: r0=274(x), r1=121(y), r2=39(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 121
LDI r2, 39
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
