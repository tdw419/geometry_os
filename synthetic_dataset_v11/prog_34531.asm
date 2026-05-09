; DESCRIPTION: Draws a magenta rectangle at (65, 74) with width 45 and height 100.
; PLAN: r0=65(x), r1=74(y), r2=45(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 74
LDI r2, 45
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
