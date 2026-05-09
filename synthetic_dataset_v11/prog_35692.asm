; DESCRIPTION: Draws a magenta rectangle at (108, 111) with width 117 and height 111.
; PLAN: r0=108(x), r1=111(y), r2=117(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 111
LDI r2, 117
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
