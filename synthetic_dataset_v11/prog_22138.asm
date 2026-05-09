; DESCRIPTION: Draws a red rectangle at (52, 116) with width 106 and height 12.
; PLAN: r0=52(x), r1=116(y), r2=106(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 116
LDI r2, 106
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
