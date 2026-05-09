; DESCRIPTION: Draws a yellow rectangle at (442, 42) with width 25 and height 66.
; PLAN: r0=442(x), r1=42(y), r2=25(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 42
LDI r2, 25
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
