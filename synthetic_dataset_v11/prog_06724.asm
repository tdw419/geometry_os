; DESCRIPTION: Draws a magenta rectangle at (46, 153) with width 36 and height 85.
; PLAN: r0=46(x), r1=153(y), r2=36(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 153
LDI r2, 36
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
