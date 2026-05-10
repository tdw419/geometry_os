; DESCRIPTION: Composite: Renders a yellow box of size 40x49 starting at (66, 177) then Sets a single red pixel at (102, 139).
; PLAN: r0=66(x), r1=177(y), r2=40(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=139(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 66
LDI r1, 177
LDI r2, 40
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 139
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
