; DESCRIPTION: Draws a green rectangle at (278, 57) with width 53 and height 37.
; PLAN: r0=278(x), r1=57(y), r2=53(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 57
LDI r2, 53
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
