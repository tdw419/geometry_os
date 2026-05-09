; DESCRIPTION: Composite: Sets a single green pixel at (247, 209) then Creates a yellow circular shape at (242, 99) with radius 74.
; PLAN: r0=247(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=99(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 242
LDI r6, 99
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
