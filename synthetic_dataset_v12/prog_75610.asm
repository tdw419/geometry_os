; DESCRIPTION: Draws a black rectangle at (253, 214) with width 113 and height 17.
; PLAN: r0=253(x), r1=214(y), r2=113(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 214
LDI r2, 113
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
