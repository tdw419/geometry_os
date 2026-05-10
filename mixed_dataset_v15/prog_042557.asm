; DESCRIPTION: Draws a yellow rectangle at (326, 84) with width 37 and height 57.
; PLAN: r0=326(x), r1=84(y), r2=37(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 84
LDI r2, 37
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
