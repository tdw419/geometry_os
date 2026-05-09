; DESCRIPTION: Draws a magenta rectangle at (140, 128) with width 21 and height 102.
; PLAN: r0=140(x), r1=128(y), r2=21(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 128
LDI r2, 21
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
