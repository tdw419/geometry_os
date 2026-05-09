; DESCRIPTION: Draws a yellow rectangle at (131, 62) with width 90 and height 12.
; PLAN: r0=131(x), r1=62(y), r2=90(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 62
LDI r2, 90
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
