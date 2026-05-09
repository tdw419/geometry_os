; DESCRIPTION: Draws a green rectangle at (65, 7) with width 37 and height 18.
; PLAN: r0=65(x), r1=7(y), r2=37(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 7
LDI r2, 37
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
