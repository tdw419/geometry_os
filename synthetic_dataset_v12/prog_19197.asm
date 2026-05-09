; DESCRIPTION: Composite: Places a red dot at position (333, 145) then Renders a cyan disk with center (68, 76) and radius 23.
; PLAN: r0=333(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=76(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 333
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 68
LDI r6, 76
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
