; DESCRIPTION: Composite: Draws a red rectangle at (138, 100) with width 35 and height 18 then Sets a single magenta pixel at (102, 118).
; PLAN: r0=138(x), r1=100(y), r2=35(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=118(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 100
LDI r2, 35
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 118
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
