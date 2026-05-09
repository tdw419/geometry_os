; DESCRIPTION: Draws a green rectangle at (326, 31) with width 90 and height 26.
; PLAN: r0=326(x), r1=31(y), r2=90(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 31
LDI r2, 90
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
