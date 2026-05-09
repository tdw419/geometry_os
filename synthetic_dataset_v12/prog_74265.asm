; DESCRIPTION: Draws a black rectangle at (271, 75) with width 14 and height 97.
; PLAN: r0=271(x), r1=75(y), r2=14(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 75
LDI r2, 14
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
