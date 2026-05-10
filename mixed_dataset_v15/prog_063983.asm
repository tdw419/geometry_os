; DESCRIPTION: Composite: Renders a cyan disk with center (337, 100) and radius 72 then Places a blue dot at position (417, 54).
; PLAN: r0=337(x), r1=100(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x), r6=54(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 100
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 54
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
