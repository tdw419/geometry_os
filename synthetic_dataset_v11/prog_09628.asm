; DESCRIPTION: Draws a green rectangle at (73, 96) with width 23 and height 96.
; PLAN: r0=73(x), r1=96(y), r2=23(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 96
LDI r2, 23
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
