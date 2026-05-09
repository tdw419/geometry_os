; DESCRIPTION: Draws a black rectangle at (175, 144) with width 60 and height 76.
; PLAN: r0=175(x), r1=144(y), r2=60(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 144
LDI r2, 60
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
