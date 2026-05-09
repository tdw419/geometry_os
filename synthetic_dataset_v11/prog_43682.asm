; DESCRIPTION: Draws a black rectangle at (50, 55) with width 101 and height 42.
; PLAN: r0=50(x), r1=55(y), r2=101(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 55
LDI r2, 101
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
