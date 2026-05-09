; DESCRIPTION: Draws a green rectangle at (70, 16) with width 62 and height 66.
; PLAN: r0=70(x), r1=16(y), r2=62(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 16
LDI r2, 62
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
