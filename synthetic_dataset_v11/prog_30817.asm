; DESCRIPTION: Draws a magenta rectangle at (177, 132) with width 64 and height 16.
; PLAN: r0=177(x), r1=132(y), r2=64(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 132
LDI r2, 64
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
