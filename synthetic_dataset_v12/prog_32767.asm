; DESCRIPTION: Composite: Places a purple dot at position (189, 192) then Creates a green circular shape at (297, 152) with radius 80.
; PLAN: r0=189(x), r1=192(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=152(y), r7=80(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 192
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 152
LDI r7, 80
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
