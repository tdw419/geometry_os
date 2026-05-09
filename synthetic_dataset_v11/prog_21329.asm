; DESCRIPTION: Draws a black rectangle at (73, 16) with width 17 and height 107.
; PLAN: r0=73(x), r1=16(y), r2=17(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 16
LDI r2, 17
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
