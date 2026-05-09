; DESCRIPTION: Draws a magenta rectangle at (57, 10) with width 31 and height 85.
; PLAN: r0=57(x), r1=10(y), r2=31(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 10
LDI r2, 31
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
