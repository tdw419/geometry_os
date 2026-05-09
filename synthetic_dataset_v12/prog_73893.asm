; DESCRIPTION: Composite: Draws a cyan rectangle at (169, 93) with width 92 and height 115 then Sets a single red pixel at (247, 1).
; PLAN: r0=169(x), r1=93(y), r2=92(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 93
LDI r2, 92
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
