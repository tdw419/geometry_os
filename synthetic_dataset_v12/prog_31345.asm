; DESCRIPTION: Draws a black rectangle at (20, 50) with width 50 and height 88.
; PLAN: r0=20(x), r1=50(y), r2=50(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 50
LDI r2, 50
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
