; DESCRIPTION: Composite: Places a cyan circle of radius 66 at center (307, 180) then Places a magenta dot at position (93, 90).
; PLAN: r0=307(x), r1=180(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=90(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 180
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 90
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
