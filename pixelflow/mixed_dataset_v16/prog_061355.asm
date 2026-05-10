; DESCRIPTION: Draws a black rectangle at (269, 58) with width 78 and height 83.
; PLAN: r0=269(x), r1=58(y), r2=78(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 58
LDI r2, 78
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
