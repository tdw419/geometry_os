; DESCRIPTION: Draws a black rectangle at (101, 18) with width 115 and height 80.
; PLAN: r0=101(x), r1=18(y), r2=115(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 18
LDI r2, 115
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
