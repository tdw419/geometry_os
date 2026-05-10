; DESCRIPTION: Draws a magenta rectangle at (354, 89) with width 105 and height 82.
; PLAN: r0=354(x), r1=89(y), r2=105(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 89
LDI r2, 105
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
