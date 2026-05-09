; DESCRIPTION: Draws a magenta rectangle at (40, 74) with width 76 and height 107.
; PLAN: r0=40(x), r1=74(y), r2=76(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 74
LDI r2, 76
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
