; DESCRIPTION: Draws a magenta rectangle at (345, 117) with width 109 and height 92.
; PLAN: r0=345(x), r1=117(y), r2=109(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 117
LDI r2, 109
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
