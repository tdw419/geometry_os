; DESCRIPTION: Draws a red rectangle at (75, 109) with width 99 and height 81.
; PLAN: r0=75(x), r1=109(y), r2=99(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 109
LDI r2, 99
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
