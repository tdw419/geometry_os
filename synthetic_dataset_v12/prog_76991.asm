; DESCRIPTION: Draws a green rectangle at (279, 167) with width 49 and height 24.
; PLAN: r0=279(x), r1=167(y), r2=49(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 167
LDI r2, 49
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
