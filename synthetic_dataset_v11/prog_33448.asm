; DESCRIPTION: Draws a red rectangle at (71, 145) with width 90 and height 54.
; PLAN: r0=71(x), r1=145(y), r2=90(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 145
LDI r2, 90
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
