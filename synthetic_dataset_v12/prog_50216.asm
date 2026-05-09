; DESCRIPTION: Draws a black rectangle at (391, 75) with width 55 and height 86.
; PLAN: r0=391(x), r1=75(y), r2=55(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 75
LDI r2, 55
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
