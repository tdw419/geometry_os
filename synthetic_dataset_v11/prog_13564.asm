; DESCRIPTION: Draws a black rectangle at (5, 3) with width 65 and height 61.
; PLAN: r0=5(x), r1=3(y), r2=65(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 3
LDI r2, 65
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
