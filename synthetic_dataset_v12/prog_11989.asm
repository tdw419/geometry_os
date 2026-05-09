; DESCRIPTION: Composite: Places a blue dot at position (203, 74) then Renders a purple disk with center (345, 150) and radius 51.
; PLAN: r0=203(x), r1=74(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=150(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 74
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 150
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
