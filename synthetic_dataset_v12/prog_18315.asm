; DESCRIPTION: Draws a magenta rectangle at (216, 20) with width 10 and height 109.
; PLAN: r0=216(x), r1=20(y), r2=10(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 20
LDI r2, 10
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
