; DESCRIPTION: Draws a magenta rectangle at (399, 121) with width 46 and height 47.
; PLAN: r0=399(x), r1=121(y), r2=46(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 121
LDI r2, 46
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
