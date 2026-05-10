; DESCRIPTION: Draws a green rectangle at (64, 35) with width 66 and height 111.
; PLAN: r0=64(x), r1=35(y), r2=66(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 35
LDI r2, 66
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
