; DESCRIPTION: Draws a green rectangle at (64, 87) with width 119 and height 24.
; PLAN: r0=64(x), r1=87(y), r2=119(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 87
LDI r2, 119
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
