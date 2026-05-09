; DESCRIPTION: Draws a yellow rectangle at (384, 49) with width 15 and height 48.
; PLAN: r0=384(x), r1=49(y), r2=15(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 49
LDI r2, 15
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
