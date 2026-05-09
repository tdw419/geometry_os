; DESCRIPTION: Draws a black rectangle at (167, 162) with width 42 and height 84.
; PLAN: r0=167(x), r1=162(y), r2=42(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 162
LDI r2, 42
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
