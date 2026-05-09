; DESCRIPTION: Draws a yellow rectangle at (128, 59) with width 117 and height 62.
; PLAN: r0=128(x), r1=59(y), r2=117(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 59
LDI r2, 117
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
