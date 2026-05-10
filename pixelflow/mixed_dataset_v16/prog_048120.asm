; DESCRIPTION: Draws a magenta rectangle at (226, 73) with width 46 and height 66.
; PLAN: r0=226(x), r1=73(y), r2=46(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 73
LDI r2, 46
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
