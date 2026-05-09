; DESCRIPTION: Draws a red rectangle at (11, 6) with width 87 and height 93.
; PLAN: r0=11(x), r1=6(y), r2=87(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 6
LDI r2, 87
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
