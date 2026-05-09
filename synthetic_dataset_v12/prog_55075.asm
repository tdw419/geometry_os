; DESCRIPTION: Draws a magenta rectangle at (21, 212) with width 32 and height 20.
; PLAN: r0=21(x), r1=212(y), r2=32(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 212
LDI r2, 32
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
