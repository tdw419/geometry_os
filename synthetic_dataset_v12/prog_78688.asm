; DESCRIPTION: Composite: Renders a white box of size 22x58 starting at (459, 182) then Sets a single white pixel at (185, 94).
; PLAN: r0=459(x), r1=182(y), r2=22(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=94(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 459
LDI r1, 182
LDI r2, 22
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 94
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
