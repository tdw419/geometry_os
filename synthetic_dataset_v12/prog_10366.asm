; DESCRIPTION: Draws a green rectangle at (354, 36) with width 54 and height 84.
; PLAN: r0=354(x), r1=36(y), r2=54(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 36
LDI r2, 54
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
