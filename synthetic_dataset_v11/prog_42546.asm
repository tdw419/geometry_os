; DESCRIPTION: Draws a black rectangle at (30, 206) with width 12 and height 40.
; PLAN: r0=30(x), r1=206(y), r2=12(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 206
LDI r2, 12
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
