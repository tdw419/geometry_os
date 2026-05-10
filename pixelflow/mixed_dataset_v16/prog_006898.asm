; DESCRIPTION: Draws a magenta rectangle at (303, 182) with width 81 and height 40.
; PLAN: r0=303(x), r1=182(y), r2=81(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 182
LDI r2, 81
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
