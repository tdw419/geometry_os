; DESCRIPTION: Composite: Creates a cyan rectangular region at (52, 39) spanning 75 by 51 pixels then Sets a single orange pixel at (112, 100).
; PLAN: r0=52(x), r1=39(y), r2=75(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=100(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 52
LDI r1, 39
LDI r2, 75
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 100
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
