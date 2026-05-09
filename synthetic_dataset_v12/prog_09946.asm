; DESCRIPTION: Draws a magenta rectangle at (17, 144) with width 34 and height 32.
; PLAN: r0=17(x), r1=144(y), r2=34(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 144
LDI r2, 34
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
