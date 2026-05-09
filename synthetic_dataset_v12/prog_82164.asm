; DESCRIPTION: Draws a red rectangle at (97, 13) with width 37 and height 86.
; PLAN: r0=97(x), r1=13(y), r2=37(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 13
LDI r2, 37
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
