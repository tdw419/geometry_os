; DESCRIPTION: Draws a magenta rectangle at (207, 2) with width 48 and height 85.
; PLAN: r0=207(x), r1=2(y), r2=48(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 2
LDI r2, 48
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
