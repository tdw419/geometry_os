; DESCRIPTION: Draws a black rectangle at (105, 102) with width 54 and height 120.
; PLAN: r0=105(x), r1=102(y), r2=54(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 102
LDI r2, 54
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
