; DESCRIPTION: Draws a magenta rectangle at (215, 198) with width 83 and height 107.
; PLAN: r0=215(x), r1=198(y), r2=83(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 198
LDI r2, 83
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
