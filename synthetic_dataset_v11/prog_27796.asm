; DESCRIPTION: Draws a magenta rectangle at (53, 34) with width 115 and height 91.
; PLAN: r0=53(x), r1=34(y), r2=115(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 34
LDI r2, 115
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
