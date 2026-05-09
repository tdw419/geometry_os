; DESCRIPTION: Composite: Places a green circle of radius 80 at center (242, 128) then Sets a single black pixel at (401, 130).
; PLAN: r0=242(x), r1=128(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=130(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 128
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 130
LDI r7, 0x000000
PSET r5, r6, r7
HALT
