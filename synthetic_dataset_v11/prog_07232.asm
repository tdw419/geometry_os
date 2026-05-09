; DESCRIPTION: Draws a black rectangle at (15, 128) with width 98 and height 37.
; PLAN: r0=15(x), r1=128(y), r2=98(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 128
LDI r2, 98
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
