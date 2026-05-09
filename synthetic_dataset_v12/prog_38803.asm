; DESCRIPTION: Draws a magenta rectangle at (371, 111) with width 45 and height 38.
; PLAN: r0=371(x), r1=111(y), r2=45(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 111
LDI r2, 45
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
