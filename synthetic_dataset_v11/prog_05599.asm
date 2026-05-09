; DESCRIPTION: Draws a yellow rectangle at (184, 21) with width 43 and height 42.
; PLAN: r0=184(x), r1=21(y), r2=43(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 21
LDI r2, 43
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
