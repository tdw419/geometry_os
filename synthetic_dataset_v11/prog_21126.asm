; DESCRIPTION: Draws a black rectangle at (32, 9) with width 117 and height 19.
; PLAN: r0=32(x), r1=9(y), r2=117(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 9
LDI r2, 117
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
