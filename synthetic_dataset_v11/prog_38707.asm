; DESCRIPTION: Draws a green rectangle at (35, 111) with width 30 and height 64.
; PLAN: r0=35(x), r1=111(y), r2=30(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 111
LDI r2, 30
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
