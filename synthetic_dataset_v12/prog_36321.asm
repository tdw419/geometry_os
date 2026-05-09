; DESCRIPTION: Composite: Places a white dot at position (177, 162) then Renders a cyan disk with center (451, 73) and radius 59.
; PLAN: r0=177(x), r1=162(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=73(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 162
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 451
LDI r6, 73
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
