; DESCRIPTION: Draws a black rectangle at (34, 17) with width 50 and height 103.
; PLAN: r0=34(x), r1=17(y), r2=50(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 17
LDI r2, 50
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
