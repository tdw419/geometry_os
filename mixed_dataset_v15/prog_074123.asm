; DESCRIPTION: Draws a black rectangle at (24, 38) with width 62 and height 83.
; PLAN: r0=24(x), r1=38(y), r2=62(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 38
LDI r2, 62
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
