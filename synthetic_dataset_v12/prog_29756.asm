; DESCRIPTION: Draws a magenta rectangle at (33, 10) with width 65 and height 30.
; PLAN: r0=33(x), r1=10(y), r2=65(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 10
LDI r2, 65
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
