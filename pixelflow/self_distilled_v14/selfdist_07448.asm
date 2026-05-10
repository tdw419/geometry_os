; DESCRIPTION: Draws a yellow rectangle at (224, 59) with width 62 and height 114.
; PLAN: r0=224(x), r1=59(y), r2=62(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 59
LDI r2, 62
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
