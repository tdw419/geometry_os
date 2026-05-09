; DESCRIPTION: Draws a red rectangle at (358, 140) with width 55 and height 87.
; PLAN: r0=358(x), r1=140(y), r2=55(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 140
LDI r2, 55
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
