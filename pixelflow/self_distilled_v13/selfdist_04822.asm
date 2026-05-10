; DESCRIPTION: Draws a green rectangle at (323, 182) with width 92 and height 112.
; PLAN: r0=323(x), r1=182(y), r2=92(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 182
LDI r2, 92
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
