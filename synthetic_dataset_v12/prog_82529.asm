; DESCRIPTION: Composite: Places a black dot at position (23, 246) then Renders a purple disk with center (215, 89) and radius 71.
; PLAN: r0=23(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=89(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 215
LDI r6, 89
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
