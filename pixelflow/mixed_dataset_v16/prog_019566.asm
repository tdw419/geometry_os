; DESCRIPTION: Draws a black rectangle at (3, 240) with width 93 and height 13.
; PLAN: r0=3(x), r1=240(y), r2=93(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 240
LDI r2, 93
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
