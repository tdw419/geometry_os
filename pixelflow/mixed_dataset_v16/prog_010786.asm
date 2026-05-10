; DESCRIPTION: Draws a magenta rectangle at (411, 21) with width 98 and height 19.
; PLAN: r0=411(x), r1=21(y), r2=98(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 21
LDI r2, 98
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
