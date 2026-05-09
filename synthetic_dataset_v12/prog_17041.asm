; DESCRIPTION: Draws a red rectangle at (426, 139) with width 65 and height 112.
; PLAN: r0=426(x), r1=139(y), r2=65(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 139
LDI r2, 65
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
