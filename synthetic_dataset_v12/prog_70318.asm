; DESCRIPTION: Composite: Places a cyan dot at position (454, 109) then Renders a orange disk with center (72, 199) and radius 24.
; PLAN: r0=454(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=199(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 109
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 199
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
