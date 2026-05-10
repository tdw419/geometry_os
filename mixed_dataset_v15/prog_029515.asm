; DESCRIPTION: Composite: Renders a magenta box of size 31x83 starting at (141, 105) then Sets a single yellow pixel at (92, 233).
; PLAN: r0=141(x), r1=105(y), r2=31(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=233(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 105
LDI r2, 31
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 233
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
