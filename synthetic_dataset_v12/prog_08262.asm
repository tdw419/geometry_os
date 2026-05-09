; DESCRIPTION: Composite: Sets a single purple pixel at (152, 203) then Creates a red circular shape at (115, 45) with radius 24.
; PLAN: r0=152(x), r1=203(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=45(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 203
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 115
LDI r6, 45
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
