; DESCRIPTION: Draws a black rectangle at (100, 196) with width 69 and height 34.
; PLAN: r0=100(x), r1=196(y), r2=69(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 196
LDI r2, 69
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
