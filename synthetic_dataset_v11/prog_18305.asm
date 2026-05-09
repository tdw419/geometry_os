; DESCRIPTION: Draws a magenta rectangle at (148, 190) with width 100 and height 16.
; PLAN: r0=148(x), r1=190(y), r2=100(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 190
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
