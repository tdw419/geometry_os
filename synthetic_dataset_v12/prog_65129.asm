; DESCRIPTION: Composite: Places a magenta circle of radius 72 at center (309, 146) then Sets a single yellow pixel at (405, 75).
; PLAN: r0=309(x), r1=146(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=75(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 146
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 75
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
