; DESCRIPTION: Draws a green rectangle at (269, 165) with width 13 and height 81.
; PLAN: r0=269(x), r1=165(y), r2=13(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 165
LDI r2, 13
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
