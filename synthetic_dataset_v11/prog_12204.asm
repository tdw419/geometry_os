; DESCRIPTION: Draws a black rectangle at (30, 205) with width 103 and height 17.
; PLAN: r0=30(x), r1=205(y), r2=103(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 205
LDI r2, 103
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
