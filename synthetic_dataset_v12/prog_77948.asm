; DESCRIPTION: Draws a magenta rectangle at (253, 96) with width 28 and height 91.
; PLAN: r0=253(x), r1=96(y), r2=28(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 96
LDI r2, 28
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
