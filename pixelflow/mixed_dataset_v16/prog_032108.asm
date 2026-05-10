; DESCRIPTION: Composite: Renders a cyan box of size 109x56 starting at (177, 118) then Sets a single yellow pixel at (395, 226).
; PLAN: r0=177(x), r1=118(y), r2=109(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=226(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 118
LDI r2, 109
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 226
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
