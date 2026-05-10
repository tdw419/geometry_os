; DESCRIPTION: Draws a red rectangle at (57, 85) with width 92 and height 74.
; PLAN: r0=57(x), r1=85(y), r2=92(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 85
LDI r2, 92
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
