; DESCRIPTION: Draws a blue rectangle at (337, 135) with width 39 and height 111.
; PLAN: r0=337(x), r1=135(y), r2=39(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 135
LDI r2, 39
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
