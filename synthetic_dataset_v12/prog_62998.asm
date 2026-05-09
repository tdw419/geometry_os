; DESCRIPTION: Draws a blue rectangle at (276, 182) with width 63 and height 51.
; PLAN: r0=276(x), r1=182(y), r2=63(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 182
LDI r2, 63
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
