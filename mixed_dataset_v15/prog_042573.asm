; DESCRIPTION: Draws a black rectangle at (420, 78) with width 16 and height 30.
; PLAN: r0=420(x), r1=78(y), r2=16(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 78
LDI r2, 16
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
