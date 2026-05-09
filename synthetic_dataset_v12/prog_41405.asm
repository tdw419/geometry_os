; DESCRIPTION: Draws a black rectangle at (377, 227) with width 20 and height 16.
; PLAN: r0=377(x), r1=227(y), r2=20(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 227
LDI r2, 20
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
