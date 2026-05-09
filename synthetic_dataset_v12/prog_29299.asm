; DESCRIPTION: Draws a black rectangle at (287, 87) with width 78 and height 77.
; PLAN: r0=287(x), r1=87(y), r2=78(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 87
LDI r2, 78
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
