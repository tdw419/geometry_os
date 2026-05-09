; DESCRIPTION: Draws a black rectangle at (10, 38) with width 43 and height 42.
; PLAN: r0=10(x), r1=38(y), r2=43(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 38
LDI r2, 43
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
