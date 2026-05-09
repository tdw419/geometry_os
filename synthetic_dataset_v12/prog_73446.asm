; DESCRIPTION: Composite: Renders a red box of size 105x25 starting at (229, 61) then Sets a single yellow pixel at (73, 87).
; PLAN: r0=229(x), r1=61(y), r2=105(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=87(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 61
LDI r2, 105
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 87
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
