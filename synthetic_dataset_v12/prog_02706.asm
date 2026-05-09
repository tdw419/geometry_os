; DESCRIPTION: Draws a green rectangle at (382, 0) with width 39 and height 19.
; PLAN: r0=382(x), r1=0(y), r2=39(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 0
LDI r2, 39
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
