; DESCRIPTION: Draws a green rectangle at (185, 122) with width 32 and height 99.
; PLAN: r0=185(x), r1=122(y), r2=32(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 122
LDI r2, 32
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
