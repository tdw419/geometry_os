; DESCRIPTION: Draws a green rectangle at (98, 49) with width 48 and height 105.
; PLAN: r0=98(x), r1=49(y), r2=48(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 49
LDI r2, 48
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
