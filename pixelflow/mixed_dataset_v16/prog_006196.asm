; DESCRIPTION: Draws a magenta rectangle at (36, 58) with width 111 and height 61.
; PLAN: r0=36(x), r1=58(y), r2=111(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 58
LDI r2, 111
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
