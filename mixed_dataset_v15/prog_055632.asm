; DESCRIPTION: Draws a black rectangle at (105, 163) with width 103 and height 56.
; PLAN: r0=105(x), r1=163(y), r2=103(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 163
LDI r2, 103
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
