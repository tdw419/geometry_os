; DESCRIPTION: Composite: Renders a yellow disk with center (105, 102) and radius 50 then Places a blue dot at position (193, 3).
; PLAN: r0=105(x), r1=102(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=3(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 102
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 3
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
