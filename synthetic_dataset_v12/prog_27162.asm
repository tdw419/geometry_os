; DESCRIPTION: Draws a black rectangle at (24, 18) with width 98 and height 21.
; PLAN: r0=24(x), r1=18(y), r2=98(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 18
LDI r2, 98
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
