; DESCRIPTION: Composite: Renders a magenta box of size 92x51 starting at (46, 183) then Renders a cyan line between points (122, 234) and (467, 158) then Sets a single magenta pixel at (24, 211).
; PLAN: r0=46(x), r1=183(y), r2=92(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=234(y1), r7=467(x2), r8=158(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=211(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 183
LDI r2, 92
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 234
LDI r7, 467
LDI r8, 158
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 211
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
