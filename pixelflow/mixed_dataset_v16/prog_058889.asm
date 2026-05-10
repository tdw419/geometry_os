; DESCRIPTION: Draws a black rectangle at (0, 10) with width 42 and height 11.
; PLAN: r0=0(x), r1=10(y), r2=42(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 10
LDI r2, 42
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
