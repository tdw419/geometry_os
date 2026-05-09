; DESCRIPTION: Draws a red rectangle at (204, 71) with width 108 and height 89.
; PLAN: r0=204(x), r1=71(y), r2=108(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 71
LDI r2, 108
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
