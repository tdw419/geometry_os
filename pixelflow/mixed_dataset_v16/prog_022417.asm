; DESCRIPTION: Draws a black rectangle at (111, 6) with width 74 and height 87.
; PLAN: r0=111(x), r1=6(y), r2=74(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 6
LDI r2, 74
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
