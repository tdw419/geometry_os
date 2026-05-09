; DESCRIPTION: Composite: Draws a red rectangle at (423, 134) with width 69 and height 100 then Sets a single magenta pixel at (120, 26).
; PLAN: r0=423(x), r1=134(y), r2=69(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=26(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 134
LDI r2, 69
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 26
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
