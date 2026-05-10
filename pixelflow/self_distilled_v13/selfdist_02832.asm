; DESCRIPTION: Draws a green rectangle at (373, 39) with width 53 and height 94.
; PLAN: r0=373(x), r1=39(y), r2=53(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 39
LDI r2, 53
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
