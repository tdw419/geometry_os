; DESCRIPTION: Draws a yellow rectangle at (236, 128) with width 43 and height 14.
; PLAN: r0=236(x), r1=128(y), r2=43(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 128
LDI r2, 43
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
