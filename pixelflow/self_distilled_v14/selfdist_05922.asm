; DESCRIPTION: Draws a magenta rectangle at (361, 74) with width 34 and height 71.
; PLAN: r0=361(x), r1=74(y), r2=34(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 74
LDI r2, 34
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
