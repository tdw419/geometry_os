; DESCRIPTION: Draws a yellow rectangle at (375, 58) with width 86 and height 62.
; PLAN: r0=375(x), r1=58(y), r2=86(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 58
LDI r2, 86
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
