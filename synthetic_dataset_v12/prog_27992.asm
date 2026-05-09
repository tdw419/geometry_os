; DESCRIPTION: Draws a red rectangle at (323, 28) with width 90 and height 85.
; PLAN: r0=323(x), r1=28(y), r2=90(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 28
LDI r2, 90
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
