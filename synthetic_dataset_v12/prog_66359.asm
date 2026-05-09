; DESCRIPTION: Draws a magenta rectangle at (297, 121) with width 118 and height 50.
; PLAN: r0=297(x), r1=121(y), r2=118(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 121
LDI r2, 118
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
