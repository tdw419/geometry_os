; DESCRIPTION: Draws a red rectangle at (355, 71) with width 116 and height 119.
; PLAN: r0=355(x), r1=71(y), r2=116(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 71
LDI r2, 116
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
