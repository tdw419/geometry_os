; DESCRIPTION: Composite: Places a cyan dot at position (460, 146) then Renders a green disk with center (423, 85) and radius 53.
; PLAN: r0=460(x), r1=146(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=423(x), r6=85(y), r7=53(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 146
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 423
LDI r6, 85
LDI r7, 53
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
