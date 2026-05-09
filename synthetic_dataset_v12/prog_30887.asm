; DESCRIPTION: Draws a black rectangle at (447, 11) with width 20 and height 60.
; PLAN: r0=447(x), r1=11(y), r2=20(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 11
LDI r2, 20
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
