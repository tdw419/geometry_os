; DESCRIPTION: Draws a yellow rectangle at (488, 15) with width 20 and height 31.
; PLAN: r0=488(x), r1=15(y), r2=20(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 15
LDI r2, 20
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
