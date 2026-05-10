; DESCRIPTION: Draws a red rectangle at (131, 145) with width 30 and height 57.
; PLAN: r0=131(x), r1=145(y), r2=30(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 145
LDI r2, 30
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
