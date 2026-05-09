; DESCRIPTION: Draws a green rectangle at (345, 177) with width 96 and height 47.
; PLAN: r0=345(x), r1=177(y), r2=96(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 177
LDI r2, 96
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
