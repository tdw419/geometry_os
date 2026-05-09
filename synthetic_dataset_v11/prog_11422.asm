; DESCRIPTION: Draws a blue rectangle at (129, 156) with width 79 and height 64.
; PLAN: r0=129(x), r1=156(y), r2=79(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 156
LDI r2, 79
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
