; DESCRIPTION: Draws a green rectangle at (233, 36) with width 97 and height 45.
; PLAN: r0=233(x), r1=36(y), r2=97(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 36
LDI r2, 97
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
