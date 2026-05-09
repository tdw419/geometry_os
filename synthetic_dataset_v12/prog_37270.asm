; DESCRIPTION: Draws a black rectangle at (211, 58) with width 112 and height 103.
; PLAN: r0=211(x), r1=58(y), r2=112(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 58
LDI r2, 112
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
