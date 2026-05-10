; DESCRIPTION: Draws a magenta rectangle at (215, 179) with width 108 and height 21.
; PLAN: r0=215(x), r1=179(y), r2=108(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 179
LDI r2, 108
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
