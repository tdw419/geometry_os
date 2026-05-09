; DESCRIPTION: Draws a black rectangle at (29, 50) with width 40 and height 96.
; PLAN: r0=29(x), r1=50(y), r2=40(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 50
LDI r2, 40
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
