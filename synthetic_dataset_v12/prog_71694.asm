; DESCRIPTION: Draws a red rectangle at (376, 178) with width 94 and height 75.
; PLAN: r0=376(x), r1=178(y), r2=94(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 178
LDI r2, 94
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
