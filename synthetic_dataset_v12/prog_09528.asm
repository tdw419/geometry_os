; DESCRIPTION: Draws a black rectangle at (21, 6) with width 95 and height 74.
; PLAN: r0=21(x), r1=6(y), r2=95(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 6
LDI r2, 95
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
