; DESCRIPTION: Composite: Places a green circle of radius 44 at center (223, 59) then Places a blue dot at position (203, 160).
; PLAN: r0=223(x), r1=59(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=160(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 59
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 160
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
