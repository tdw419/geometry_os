; DESCRIPTION: Draws a magenta rectangle at (193, 58) with width 47 and height 111.
; PLAN: r0=193(x), r1=58(y), r2=47(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 58
LDI r2, 47
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
