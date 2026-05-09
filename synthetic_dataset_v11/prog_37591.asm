; DESCRIPTION: Draws a magenta rectangle at (165, 32) with width 40 and height 34.
; PLAN: r0=165(x), r1=32(y), r2=40(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 32
LDI r2, 40
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
