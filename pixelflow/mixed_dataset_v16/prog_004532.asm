; DESCRIPTION: Draws a black rectangle at (131, 98) with width 108 and height 101.
; PLAN: r0=131(x), r1=98(y), r2=108(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 98
LDI r2, 108
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
