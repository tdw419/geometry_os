; DESCRIPTION: Draws a yellow rectangle at (354, 48) with width 39 and height 43.
; PLAN: r0=354(x), r1=48(y), r2=39(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 48
LDI r2, 39
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
