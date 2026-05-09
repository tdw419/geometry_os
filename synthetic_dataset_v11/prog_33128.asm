; DESCRIPTION: Draws a magenta rectangle at (129, 27) with width 73 and height 57.
; PLAN: r0=129(x), r1=27(y), r2=73(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 27
LDI r2, 73
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
