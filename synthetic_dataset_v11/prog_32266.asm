; DESCRIPTION: Draws a magenta rectangle at (123, 165) with width 10 and height 65.
; PLAN: r0=123(x), r1=165(y), r2=10(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 165
LDI r2, 10
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
