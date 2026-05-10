; DESCRIPTION: Composite: Places a red dot at position (62, 129) then Creates a green circular shape at (303, 160) with radius 32.
; PLAN: r0=62(x), r1=129(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=160(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 129
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 303
LDI r6, 160
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
