; DESCRIPTION: Draws a magenta rectangle at (21, 128) with width 79 and height 98.
; PLAN: r0=21(x), r1=128(y), r2=79(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 128
LDI r2, 79
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
