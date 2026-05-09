; DESCRIPTION: Draws a magenta rectangle at (60, 84) with width 86 and height 21.
; PLAN: r0=60(x), r1=84(y), r2=86(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 84
LDI r2, 86
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
