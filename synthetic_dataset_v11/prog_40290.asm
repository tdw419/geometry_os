; DESCRIPTION: Draws a yellow rectangle at (86, 42) with width 29 and height 26.
; PLAN: r0=86(x), r1=42(y), r2=29(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 42
LDI r2, 29
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
