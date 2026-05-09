; DESCRIPTION: Draws a black rectangle at (197, 45) with width 40 and height 101.
; PLAN: r0=197(x), r1=45(y), r2=40(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 45
LDI r2, 40
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
