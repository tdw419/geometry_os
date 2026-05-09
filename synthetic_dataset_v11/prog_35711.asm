; DESCRIPTION: Draws a magenta rectangle at (16, 166) with width 20 and height 31.
; PLAN: r0=16(x), r1=166(y), r2=20(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 166
LDI r2, 20
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
