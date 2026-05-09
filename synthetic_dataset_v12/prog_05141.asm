; DESCRIPTION: Draws a red rectangle at (44, 10) with width 101 and height 71.
; PLAN: r0=44(x), r1=10(y), r2=101(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 10
LDI r2, 101
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
