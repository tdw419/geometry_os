; DESCRIPTION: Draws a black rectangle at (14, 53) with width 87 and height 16.
; PLAN: r0=14(x), r1=53(y), r2=87(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 53
LDI r2, 87
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
