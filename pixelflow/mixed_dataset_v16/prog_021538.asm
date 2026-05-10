; DESCRIPTION: Draws a black rectangle at (20, 120) with width 15 and height 86.
; PLAN: r0=20(x), r1=120(y), r2=15(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 120
LDI r2, 15
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
