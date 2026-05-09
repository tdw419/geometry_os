; DESCRIPTION: Draws a black rectangle at (72, 42) with width 81 and height 31.
; PLAN: r0=72(x), r1=42(y), r2=81(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 42
LDI r2, 81
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
