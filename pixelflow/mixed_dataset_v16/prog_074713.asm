; DESCRIPTION: Composite: Draws a magenta rectangle at (203, 140) with width 89 and height 68 then Sets a single magenta pixel at (162, 182).
; PLAN: r0=203(x), r1=140(y), r2=89(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=182(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 140
LDI r2, 89
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 182
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
