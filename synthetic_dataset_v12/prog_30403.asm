; DESCRIPTION: Draws a green rectangle at (48, 102) with width 94 and height 73.
; PLAN: r0=48(x), r1=102(y), r2=94(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 102
LDI r2, 94
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
