; DESCRIPTION: Draws a red rectangle at (354, 5) with width 52 and height 118.
; PLAN: r0=354(x), r1=5(y), r2=52(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 5
LDI r2, 52
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
