; DESCRIPTION: Composite: Places a red line segment connecting (334, 242) to (379, 227) then Places a black dot at position (226, 224).
; PLAN: r0=334(x1), r1=242(y1), r2=379(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=224(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 242
LDI r2, 379
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 224
LDI r7, 0x000000
PSET r5, r6, r7
HALT
