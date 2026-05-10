; DESCRIPTION: Draws a magenta rectangle at (215, 192) with width 81 and height 39.
; PLAN: r0=215(x), r1=192(y), r2=81(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 192
LDI r2, 81
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
