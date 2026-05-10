; DESCRIPTION: Composite: Places a magenta dot at position (41, 91) then Renders a cyan disk with center (139, 218) and radius 25.
; PLAN: r0=41(x), r1=91(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=218(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 91
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 218
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
