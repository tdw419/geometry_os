; DESCRIPTION: Draws a green rectangle at (216, 65) with width 32 and height 108.
; PLAN: r0=216(x), r1=65(y), r2=32(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 65
LDI r2, 32
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
