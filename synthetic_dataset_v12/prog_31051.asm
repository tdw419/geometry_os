; DESCRIPTION: Draws a green rectangle at (81, 86) with width 37 and height 46.
; PLAN: r0=81(x), r1=86(y), r2=37(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 86
LDI r2, 37
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
