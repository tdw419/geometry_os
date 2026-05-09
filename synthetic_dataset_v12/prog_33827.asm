; DESCRIPTION: Composite: Places a green circle of radius 65 at center (262, 129) then Sets a single yellow pixel at (510, 4).
; PLAN: r0=262(x), r1=129(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x), r6=4(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 129
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 4
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
