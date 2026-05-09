; DESCRIPTION: Draws a yellow rectangle at (354, 153) with width 63 and height 53.
; PLAN: r0=354(x), r1=153(y), r2=63(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 153
LDI r2, 63
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
