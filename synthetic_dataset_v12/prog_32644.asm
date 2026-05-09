; DESCRIPTION: Composite: Places a cyan dot at position (136, 133) then Places a cyan circle of radius 52 at center (64, 60).
; PLAN: r0=136(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=64(x), r6=60(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 64
LDI r6, 60
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
