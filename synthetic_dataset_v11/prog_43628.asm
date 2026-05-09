; DESCRIPTION: Draws a magenta rectangle at (16, 120) with width 94 and height 78.
; PLAN: r0=16(x), r1=120(y), r2=94(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 120
LDI r2, 94
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
