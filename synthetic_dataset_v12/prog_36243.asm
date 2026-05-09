; DESCRIPTION: Draws a magenta rectangle at (177, 121) with width 27 and height 91.
; PLAN: r0=177(x), r1=121(y), r2=27(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 121
LDI r2, 27
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
