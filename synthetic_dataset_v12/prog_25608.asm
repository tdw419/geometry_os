; DESCRIPTION: Draws a black rectangle at (64, 81) with width 14 and height 71.
; PLAN: r0=64(x), r1=81(y), r2=14(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 81
LDI r2, 14
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
