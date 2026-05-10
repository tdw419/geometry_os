; DESCRIPTION: Draws a magenta rectangle at (32, 18) with width 40 and height 12.
; PLAN: r0=32(x), r1=18(y), r2=40(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 18
LDI r2, 40
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
