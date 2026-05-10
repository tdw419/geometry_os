; DESCRIPTION: Draws a purple rectangle at (241, 35) with width 59 and height 39.
; PLAN: r0=241(x), r1=35(y), r2=59(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 35
LDI r2, 59
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
