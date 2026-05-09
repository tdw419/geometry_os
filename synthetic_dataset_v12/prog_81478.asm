; DESCRIPTION: Composite: Places a cyan dot at position (129, 21) then Renders a yellow disk with center (61, 162) and radius 38.
; PLAN: r0=129(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=162(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 61
LDI r6, 162
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
