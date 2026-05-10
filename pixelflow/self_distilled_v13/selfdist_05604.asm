; DESCRIPTION: Draws a green rectangle at (124, 7) with width 24 and height 73.
; PLAN: r0=124(x), r1=7(y), r2=24(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 7
LDI r2, 24
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
