; DESCRIPTION: Draws a yellow rectangle at (10, 142) with width 42 and height 62.
; PLAN: r0=10(x), r1=142(y), r2=42(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 142
LDI r2, 42
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
