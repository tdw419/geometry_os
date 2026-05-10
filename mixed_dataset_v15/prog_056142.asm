; DESCRIPTION: Composite: Places a blue dot at position (260, 195) then Renders a red disk with center (339, 131) and radius 62.
; PLAN: r0=260(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=131(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 195
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 131
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
