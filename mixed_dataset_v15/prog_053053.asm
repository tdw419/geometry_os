; DESCRIPTION: Draws a magenta rectangle at (169, 194) with width 60 and height 11.
; PLAN: r0=169(x), r1=194(y), r2=60(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 194
LDI r2, 60
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
