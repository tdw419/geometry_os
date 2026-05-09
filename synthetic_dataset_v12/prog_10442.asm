; DESCRIPTION: Draws a green rectangle at (36, 4) with width 57 and height 67.
; PLAN: r0=36(x), r1=4(y), r2=57(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 4
LDI r2, 57
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
