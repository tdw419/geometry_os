; DESCRIPTION: Draws a red rectangle at (83, 156) with width 68 and height 98.
; PLAN: r0=83(x), r1=156(y), r2=68(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 156
LDI r2, 68
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
