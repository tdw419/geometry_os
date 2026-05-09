; DESCRIPTION: Composite: Renders a white disk with center (444, 68) and radius 44 then Places a blue dot at position (450, 206).
; PLAN: r0=444(x), r1=68(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x), r6=206(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 444
LDI r1, 68
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 206
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
