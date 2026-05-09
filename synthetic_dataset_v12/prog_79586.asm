; DESCRIPTION: Draws a black rectangle at (131, 33) with width 105 and height 56.
; PLAN: r0=131(x), r1=33(y), r2=105(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 33
LDI r2, 105
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
