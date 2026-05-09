; DESCRIPTION: Draws a black rectangle at (79, 17) with width 86 and height 20.
; PLAN: r0=79(x), r1=17(y), r2=86(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 17
LDI r2, 86
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
