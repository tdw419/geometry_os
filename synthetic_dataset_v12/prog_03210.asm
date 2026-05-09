; DESCRIPTION: Draws a black rectangle at (336, 163) with width 19 and height 79.
; PLAN: r0=336(x), r1=163(y), r2=19(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 163
LDI r2, 19
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
