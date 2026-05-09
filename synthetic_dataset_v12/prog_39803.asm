; DESCRIPTION: Composite: Places a purple dot at position (439, 28) then Creates a red circular shape at (135, 224) with radius 22.
; PLAN: r0=439(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=224(y), r7=22(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 224
LDI r7, 22
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
