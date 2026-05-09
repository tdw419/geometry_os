; DESCRIPTION: Composite: Renders a blue box of size 79x89 starting at (309, 60) then Sets a single yellow pixel at (486, 16).
; PLAN: r0=309(x), r1=60(y), r2=79(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x), r6=16(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 60
LDI r2, 79
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 16
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
