; DESCRIPTION: Draws a green rectangle at (124, 21) with width 14 and height 23.
; PLAN: r0=124(x), r1=21(y), r2=14(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 21
LDI r2, 14
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
