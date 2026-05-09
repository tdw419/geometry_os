; DESCRIPTION: Draws a magenta rectangle at (50, 86) with width 47 and height 85.
; PLAN: r0=50(x), r1=86(y), r2=47(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 86
LDI r2, 47
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
