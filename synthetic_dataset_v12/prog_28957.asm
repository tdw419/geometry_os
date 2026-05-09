; DESCRIPTION: Draws a black rectangle at (462, 197) with width 19 and height 20.
; PLAN: r0=462(x), r1=197(y), r2=19(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 197
LDI r2, 19
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
