; DESCRIPTION: Draws a magenta rectangle at (468, 50) with width 36 and height 54.
; PLAN: r0=468(x), r1=50(y), r2=36(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 50
LDI r2, 36
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
