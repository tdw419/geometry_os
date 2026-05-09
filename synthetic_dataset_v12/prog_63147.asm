; DESCRIPTION: Composite: Places a red circle of radius 64 at center (380, 106) then Places a magenta dot at position (211, 216).
; PLAN: r0=380(x), r1=106(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=216(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 106
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 216
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
