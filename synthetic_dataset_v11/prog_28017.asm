; DESCRIPTION: Draws a green rectangle at (71, 0) with width 24 and height 22.
; PLAN: r0=71(x), r1=0(y), r2=24(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 0
LDI r2, 24
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
