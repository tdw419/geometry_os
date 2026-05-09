; DESCRIPTION: Draws a green rectangle at (54, 64) with width 72 and height 29.
; PLAN: r0=54(x), r1=64(y), r2=72(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 64
LDI r2, 72
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
