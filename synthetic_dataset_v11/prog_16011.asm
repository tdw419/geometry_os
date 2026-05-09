; DESCRIPTION: Draws a yellow rectangle at (128, 69) with width 23 and height 108.
; PLAN: r0=128(x), r1=69(y), r2=23(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 69
LDI r2, 23
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
