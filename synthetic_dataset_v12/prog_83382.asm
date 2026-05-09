; DESCRIPTION: Draws a magenta rectangle at (459, 190) with width 13 and height 23.
; PLAN: r0=459(x), r1=190(y), r2=13(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 190
LDI r2, 13
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
