; DESCRIPTION: Composite: Places a blue dot at position (222, 13) then Renders a blue disk with center (221, 185) and radius 56.
; PLAN: r0=222(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=185(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 13
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 185
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
