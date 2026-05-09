; DESCRIPTION: Draws a magenta rectangle at (129, 134) with width 65 and height 27.
; PLAN: r0=129(x), r1=134(y), r2=65(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 134
LDI r2, 65
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
