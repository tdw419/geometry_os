; DESCRIPTION: Draws a black rectangle at (58, 56) with width 50 and height 40.
; PLAN: r0=58(x), r1=56(y), r2=50(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 56
LDI r2, 50
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
