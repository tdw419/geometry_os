; DESCRIPTION: Draws a magenta rectangle at (328, 58) with width 94 and height 33.
; PLAN: r0=328(x), r1=58(y), r2=94(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 58
LDI r2, 94
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
