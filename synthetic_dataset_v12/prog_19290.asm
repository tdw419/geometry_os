; DESCRIPTION: Draws a black rectangle at (63, 113) with width 86 and height 92.
; PLAN: r0=63(x), r1=113(y), r2=86(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 113
LDI r2, 86
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
