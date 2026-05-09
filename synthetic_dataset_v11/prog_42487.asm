; DESCRIPTION: Draws a magenta rectangle at (94, 32) with width 61 and height 41.
; PLAN: r0=94(x), r1=32(y), r2=61(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 32
LDI r2, 61
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
