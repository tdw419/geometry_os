; DESCRIPTION: Draws a red rectangle at (373, 169) with width 26 and height 71.
; PLAN: r0=373(x), r1=169(y), r2=26(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 169
LDI r2, 26
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
