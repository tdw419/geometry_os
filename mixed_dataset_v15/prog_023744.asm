; DESCRIPTION: Draws a yellow rectangle at (191, 184) with width 62 and height 42.
; PLAN: r0=191(x), r1=184(y), r2=62(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 184
LDI r2, 62
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
