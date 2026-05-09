; DESCRIPTION: Draws a magenta rectangle at (22, 154) with width 93 and height 41.
; PLAN: r0=22(x), r1=154(y), r2=93(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 154
LDI r2, 93
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
