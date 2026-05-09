; DESCRIPTION: Draws a black rectangle at (32, 40) with width 85 and height 49.
; PLAN: r0=32(x), r1=40(y), r2=85(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 40
LDI r2, 85
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
