; DESCRIPTION: Draws a green rectangle at (12, 24) with width 60 and height 105.
; PLAN: r0=12(x), r1=24(y), r2=60(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 24
LDI r2, 60
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
