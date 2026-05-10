; DESCRIPTION: Draws a red rectangle at (85, 72) with width 36 and height 12.
; PLAN: r0=85(x), r1=72(y), r2=36(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 72
LDI r2, 36
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
