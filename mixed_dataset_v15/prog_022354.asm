; DESCRIPTION: Draws a black rectangle at (128, 22) with width 22 and height 82.
; PLAN: r0=128(x), r1=22(y), r2=22(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 22
LDI r2, 22
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
