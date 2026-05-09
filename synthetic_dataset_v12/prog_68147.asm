; DESCRIPTION: Draws a magenta rectangle at (361, 142) with width 107 and height 82.
; PLAN: r0=361(x), r1=142(y), r2=107(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 142
LDI r2, 107
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
