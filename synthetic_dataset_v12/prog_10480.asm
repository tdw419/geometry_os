; DESCRIPTION: Draws a red rectangle at (0, 166) with width 101 and height 71.
; PLAN: r0=0(x), r1=166(y), r2=101(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 166
LDI r2, 101
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
