; DESCRIPTION: Composite: Places a cyan circle of radius 45 at center (74, 56) then Places a magenta dot at position (365, 134).
; PLAN: r0=74(x), r1=56(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=134(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 74
LDI r1, 56
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 134
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
