; DESCRIPTION: Draws a black rectangle at (256, 111) with width 119 and height 52.
; PLAN: r0=256(x), r1=111(y), r2=119(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 111
LDI r2, 119
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
