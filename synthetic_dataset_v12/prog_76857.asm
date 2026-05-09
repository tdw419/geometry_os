; DESCRIPTION: Draws a black rectangle at (120, 167) with width 101 and height 64.
; PLAN: r0=120(x), r1=167(y), r2=101(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 167
LDI r2, 101
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
