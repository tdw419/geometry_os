; DESCRIPTION: Draws a black rectangle at (39, 42) with width 23 and height 49.
; PLAN: r0=39(x), r1=42(y), r2=23(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 42
LDI r2, 23
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
