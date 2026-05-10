; DESCRIPTION: Composite: Places a cyan dot at position (7, 230) then Creates a green circular shape at (290, 174) with radius 73.
; PLAN: r0=7(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=174(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 7
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 174
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
