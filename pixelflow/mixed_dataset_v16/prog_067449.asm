; DESCRIPTION: Draws a yellow rectangle at (144, 42) with width 62 and height 86.
; PLAN: r0=144(x), r1=42(y), r2=62(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 42
LDI r2, 62
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
