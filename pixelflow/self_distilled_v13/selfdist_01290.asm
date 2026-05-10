; DESCRIPTION: Draws a magenta rectangle at (328, 2) with width 21 and height 111.
; PLAN: r0=328(x), r1=2(y), r2=21(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 2
LDI r2, 21
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
