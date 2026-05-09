; DESCRIPTION: Draws a magenta rectangle at (231, 162) with width 58 and height 64.
; PLAN: r0=231(x), r1=162(y), r2=58(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 162
LDI r2, 58
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
