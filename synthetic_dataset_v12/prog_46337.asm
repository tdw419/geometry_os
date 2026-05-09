; DESCRIPTION: Draws a green rectangle at (0, 189) with width 24 and height 20.
; PLAN: r0=0(x), r1=189(y), r2=24(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 189
LDI r2, 24
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
