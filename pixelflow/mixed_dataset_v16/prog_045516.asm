; DESCRIPTION: Composite: Places a black dot at position (3, 103) then Renders a blue disk with center (292, 82) and radius 30.
; PLAN: r0=3(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=82(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 103
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 292
LDI r6, 82
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
